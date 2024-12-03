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
    try {
      return await userClient.getMe();
    } catch (e) {
      throw Exception('Failed to fetch user data: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> getUserByUsername(String username) async {
    // TODO: set a cache system?
    try {
      return await userClient.getUserByUsername(username);
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        throw UsernameNotFoundException('Username \'$username\' not found');
      } else {
        throw Exception('Failed to fetch user data: ${e.toString()}');
      }
    }
  }
}

class UsernameNotFoundException implements Exception {
  final String message;

  UsernameNotFoundException(this.message);

  @override
  String toString() => message;
}
