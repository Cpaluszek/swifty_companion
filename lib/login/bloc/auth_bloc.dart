import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:oauth2_client/oauth2_exception.dart';
import 'package:swifty_companion/login/bloc/auth_event.dart';
import 'package:swifty_companion/login/bloc/auth_state.dart';
import 'package:swifty_companion/config/env_config.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/oauth2_client.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<InitRequested>(_onInitRequested);
  }

  // TODO: token storage between launch
  // You should persist the authentication token securely (e.g., using flutter_secure_storage) so that users don’t have to log in every time they open the app.
  // You can load the token in the AuthBloc during initialization and use it in subsequent API calls.

  Future<void> _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final client = OAuth2Client(
      authorizeUrl: EnvConfig.authorizeUrl,
      tokenUrl: EnvConfig.tokenUrl,
      redirectUri: EnvConfig.redirectUri,
      customUriScheme: EnvConfig.uriScheme,
    );
    try {
      AccessTokenResponse? token = await client.getTokenWithAuthCodeFlow(
        clientId: EnvConfig.apiUid,
        clientSecret: EnvConfig.apiSecret,
        scopes: ['public'],
      );
      // TODO: manage token expiration
      // if (token.isExpired()) {
      //   await _oAuth2helper.refreshToken(token);
      //   token = await _oAuth2helper.getToken();
      // }
      final accessToken = token.accessToken ?? '';
      final refreshToken = token.refreshToken ?? '';
      final expiration = token.expirationDate ?? DateTime(0);

      emit(AuthSuccess(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiration: expiration,
      ));
    } catch (e) {
      if (e is DioException) {
        emit(AuthFailure('Network error: ${e.message}'));
      } else if (e is OAuth2Exception) {
        emit(AuthFailure('OAuth error: ${e.error}'));
      } else {
        emit(AuthFailure('An unknown error occurred: ${e.toString()}'));
      }
    }
  }

  void _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }

  void _onInitRequested(InitRequested event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }
}
