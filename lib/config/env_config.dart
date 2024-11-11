import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static late final String apiBaseUrl;
  static late final String apiUid;
  static late final String apiSecret;

  static late final String authorizeUrl;
  static late final String tokenUrl;

  static late final String uriScheme;
  static late final String redirectUri;

  static const String me = '/v2/me';

  static Future<void> loadEnv() async {
    await dotenv.load(fileName: '.env');

    apiUid = _getEnvVar('API_UID');
    apiSecret = _getEnvVar('API_SECRET');
    apiBaseUrl = _getEnvVar('API_URL');
    tokenUrl = '${AppConfig.apiBaseUrl}/oauth/token';
    authorizeUrl = '${AppConfig.apiBaseUrl}/oauth/authorize';

    uriScheme = _getEnvVar('URI_SCHEME');
    redirectUri = '$uriScheme://${_getEnvVar('REDIRECT_URI')}';
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
