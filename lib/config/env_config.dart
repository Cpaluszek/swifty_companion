import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  // Prevents from object instantiation
  EnvConfig._();

  static String apiBaseUrl = dotenv.env["API_URL"] ?? "";
  static String apiAuthEndpoint = dotenv.env["AUTH_ENDPOINT"] ?? "";

  static const String authWebRedirect = "http://localhost:3000";
  static const String authMobileRedirect = "com.cpalusze.swifty_companion";
}
