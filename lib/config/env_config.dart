import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  // Prevents from object instantiation
  EnvConfig._();

  static late String apiBaseUrl;
  static late String apiAuthEndpoint;

  static late String apiUid;
  static late String apiSecret;

  static const String authWebRedirect = "http://localhost:3000";
  static const String authMobileRedirect = "com.cpalusze.swifty_companion";

  static Future<void> loadEnv() async {
    await dotenv.load(fileName: ".env");

    apiBaseUrl = _getEnvVar("API_URL");
    apiAuthEndpoint = _getEnvVar("AUTH_ENDPOINT");
    apiUid = _getEnvVar("API_UID");
    apiSecret = _getEnvVar("API_SECRET");
  }

  static String _getEnvVar(String key) {
    final value = dotenv.env[key];

    if (value == null) {
      throw EnvVarNotFoundException(key);
    }
    return value;
  }
}

class EnvVarNotFoundException implements Exception {
  final String key;

  EnvVarNotFoundException(this.key) : super();

  @override
  String toString() {
    return 'Environment variable "$key" not found.';
  }
}
