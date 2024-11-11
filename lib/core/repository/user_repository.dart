import 'package:dio/dio.dart';
import 'package:swifty_companion/core/client/user_client.dart';
import 'package:swifty_companion/core/model/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getMe();
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.dio}) {
    userClient = UserClient(dio: dio);
  }

  final Dio dio;
  late final UserClient userClient;

  @override
  Future<UserModel> getMe() async {
    try {
      return await userClient.getMe();
    } catch (e) {
      throw Exception('Failed to fetch user data');
    }
  }
}
