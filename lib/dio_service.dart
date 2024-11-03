import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:swifty_companion/config/env_config.dart';

final kBaseOptions = BaseOptions(
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 5),
  contentType: Headers.jsonContentType,
);

class DioService {
  final Dio _dio = Dio(kBaseOptions);

  final String _host = '${EnvConfig.apiBaseUrl}/v2';

  DioService() {
    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
    ));
  }

  Future<Response<Map<String, dynamic>>> get<R>(
      {required String endpoint}) async {
    // TODO: find a way to manage the token properly
    final token = '';
    final response = await _dio.get<Map<String, dynamic>>(
      _host + endpoint,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return response;
  }
}

/*

class ApiInterceptor extends Interceptor {
  ApiInterceptor({
    required this.context,
  }) : super();

  final BuildContext context;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final userToken = await context
        .read<AuthenticationProvider>()
        .authenticationService
        .getToken;
    print(userToken);
    if (options.extra.containsKey('requiresAuthToken')) {
      if (options.extra['requiresAuthToken'] == true) {
        options.headers.addAll(
          <String, Object?>{
            'Authorization': 'Bearer ${userToken?.accessToken ?? ""}'
          },
        );
      }
      options.extra.remove('requiresAuthToken');
    }
    return handler.next(options);
  }
}
 */
