import 'package:dio/dio.dart';
import 'package:swifty_companion/core/client/user_client.dart';
import 'package:swifty_companion/core/model/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getMe();

  Future<UserModel> getUserByUsername(String username);
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.dio}) {
    userClient = UserClient(dio: dio);
  }

  final Dio dio;
  late final UserClient userClient;

  @override
  Future<UserModel> getMe() async {
    return await userClient.getMe();
  }

  @override
  Future<UserModel> getUserByUsername(String username) async {
    return await userClient.getUserByUsername(username);
  }
}
