import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:swifty_companion/login/bloc/auth_event.dart';
import 'package:swifty_companion/login/bloc/auth_state.dart';
import 'package:swifty_companion/config/env_config.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<InitRequested>(_onInitRequested);
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final client = await oauth2.clientCredentialsGrant(
        Uri.parse(EnvConfig.tokenUrl),
        EnvConfig.apiUid,
        EnvConfig.apiSecret,
        httpClient: http.Client(),
      );
      Logger logger = Logger();
      logger.i(jsonEncode(client.credentials));

      final accessToken = client.credentials.accessToken;
      final refreshToken = client.credentials.refreshToken ?? '';
      final expiration = client.credentials.expiration ?? DateTime(0);

      emit(AuthSuccess(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiration: expiration,
      ));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }

  void _onInitRequested(InitRequested event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }
}
