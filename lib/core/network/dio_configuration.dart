import 'package:dio/dio.dart';
import 'package:swifty_companion/core/network/api_interceptor.dart';
import 'package:swifty_companion/modules/login/bloc/auth_bloc.dart';

class DioConfiguration {
  late final Dio dio;
  final AuthBloc authBloc;

  static final kBaseOptions = BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    contentType: Headers.jsonContentType,
  );

  DioConfiguration({required this.authBloc}) {
    dio = Dio(kBaseOptions);
    // dio.interceptors.add(PrettyDioLogger(
    //   responseBody: true,
    //   requestHeader: true,
    // ));
    dio.interceptors.add(ApiInterceptor(authBloc: authBloc));
  }
}
