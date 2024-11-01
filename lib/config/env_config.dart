import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  // Prevents from object instantiation
  EnvConfig._();

  static late String _apiBaseUrl;
  static late String _apiAuthEndpoint;

  static late String apiUid;
  static late String apiSecret;

  static late String authorizeUrl;
  static late String tokenUrl;

  static const String mobileUriScheme = "com.cpalusze.switfy_companion";
  static const String webUriScheme = "http://localhost:52802";
  static const String _redirectUri = '/';

  static const String authWebRedirect = '$webUriScheme$_redirectUri';
  static const String authMobileRedirect = '$webUriScheme$_redirectUri';

  static Future<void> loadEnv() async {
    await dotenv.load(fileName: ".env");

    _apiBaseUrl = _getEnvVar("API_URL");
    _apiAuthEndpoint = _getEnvVar("AUTH_ENDPOINT");
    apiUid = _getEnvVar("API_UID");
    apiSecret = _getEnvVar("API_SECRET");

    authorizeUrl = EnvConfig._apiBaseUrl + EnvConfig._apiAuthEndpoint;
    tokenUrl = '${EnvConfig._apiBaseUrl}/token';
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
