import 'dart:convert';
import 'package:swifty_companion/config/env_config.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class AuthService {
  static Future<String?> authenticate() async {
    Logger logger = Logger();
    try {
      // TODO: there is no refresh token for the moment
      final client = await oauth2.clientCredentialsGrant(
        Uri.parse(EnvConfig.tokenUrl),
        EnvConfig.apiUid,
        EnvConfig.apiSecret,
        httpClient: http.Client(),
      );
      logger.i(jsonEncode(client.credentials));
      return client.credentials.accessToken;
    } catch (e) {
      logger.e('Error getting token: $e');
      return null;
    }
  }
}
