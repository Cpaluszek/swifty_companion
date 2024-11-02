import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  // Prevents from object instantiation
  EnvConfig._();

  static late String apiBaseUrl;

  static late String apiUid;
  static late String apiSecret;

  static late String authorizeUrl;
  static late String tokenUrl;

  static Future<void> loadEnv() async {
    await dotenv.load(fileName: ".env");

    apiUid = _getEnvVar("API_UID");
    apiSecret = _getEnvVar("API_SECRET");
    apiBaseUrl = _getEnvVar("API_URL");
    tokenUrl = '${EnvConfig.apiBaseUrl}/oauth/token';
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
