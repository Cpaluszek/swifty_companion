import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:swifty_companion/config/env_config.dart';
import 'package:swifty_companion/core/model/user_model.dart';

part 'user_client.g.dart';

@RestApi()
abstract class UserClient {
  factory UserClient({required Dio dio}) {
    return _UserClient(dio, baseUrl: AppConfig.apiBaseUrl);
  }

  @GET(AppConfig.me)
  Future<UserModel> getMe();
}
