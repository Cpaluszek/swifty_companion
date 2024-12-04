import 'package:dio/dio.dart';
import 'package:swifty_companion/modules/login/bloc/auth_bloc.dart';
import 'package:swifty_companion/utils.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor({
    required this.authBloc,
  }) : super();

  final AuthBloc authBloc;
  bool _isRefreshing = false;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authState = authBloc.state;

    if (authState is AuthSuccess) {
      if (isTokenExpired(authState.expiration)) {
        await _refreshToken(options, handler);
      } else {
        options.headers['Authorization'] = 'Bearer ${authState.accessToken}';
        return handler.next(options);
      }
    } else {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: 'Access token has expired, session is no longer valid',
        ),
      );
    }
  }

  Future<void> _refreshToken(RequestOptions options, RequestInterceptorHandler handler) async {
    if (_isRefreshing) {
      await Future.delayed(const Duration(milliseconds: 100));
      return _refreshToken(options, handler);
    }
    _isRefreshing = true;

    try {
      final refreshedState = await authBloc.refreshToken();
      authBloc.add(RefreshCompleted(refreshedState));

      if (refreshedState is AuthSuccess) {
        options.headers['Authorization'] = 'Bearer ${refreshedState.accessToken}';
        return handler.next(options);
      } else {
        authBloc.add(LogoutRequested());
        return handler.reject(
          DioException(
            requestOptions: options,
            error: 'Access token has expired, session is no longer valid',
          ),
        );
      }
    } catch (e) {
      authBloc.add(LogoutRequested());
      return handler.reject(
        DioException(
          requestOptions: options,
          error: 'Failed to refresh token',
        ),
      );
    } finally {
      _isRefreshing = false;
    }
  }
}
