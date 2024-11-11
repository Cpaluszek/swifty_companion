import 'package:dio/dio.dart';
import 'package:swifty_companion/modules/login/bloc/auth_bloc.dart';
import 'package:swifty_companion/modules/login/bloc/auth_state.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor({
    required this.authBloc,
  }) : super();

  final AuthBloc authBloc;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authState = authBloc.state;
    final token = authState is AuthSuccess ? authState.accessToken : null;

    // TODO: refresh
    // if (isTokenExpired(state.accessToken)) {
    //   final newToken = await refreshToken(state.refreshToken);
    //   emit(AuthSuccess(
    //     accessToken: newToken.accessToken,
    //     refreshToken: newToken.refreshToken,
    //     expiration: newToken.expiration,
    //   ));
    // }
    if (token == null) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: 'Access token has expired, session is no longer valid',
        ),
      );
    }

    options.headers.addAll(
      <String, Object?>{'Authorization': 'Bearer $token'},
    );
    return handler.next(options);
  }
}
