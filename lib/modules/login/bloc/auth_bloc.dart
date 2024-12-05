import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oauth2_client/oauth2_exception.dart';
import 'package:swifty_companion/config/app_config.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:swifty_companion/utils.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _storage = const FlutterSecureStorage();
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _expirationKey = 'expiration';

  AuthBloc() : super(const AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<InitRequested>(_onInitRequested);
    on<RefreshCompleted>(_onRefreshCompleted);
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());

    final client = _createOAuth2Client();

    try {
      AccessTokenResponse? token = await client.getTokenWithAuthCodeFlow(
        clientId: AppConfig.apiUid,
        clientSecret: AppConfig.apiSecret,
        scopes: ['public'],
      );

      await _storeToken(token);
      emit(_createAuthSuccessState(token));
    } catch (e) {
      emit(_createAuthFailureState(e));
    }
  }

  void _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) async {
    try {
      await _clearStoredToken();
      emit(const AuthInitial());
    } catch (e) {
      emit(AuthFailure('Failed to clear stored tokens: ${e.toString()}'));
    }
  }

  void _onInitRequested(InitRequested event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());

    late String? storedAccessToken;
    late String? storedRefreshToken;
    late String? storedExpiration;
    try {
      storedAccessToken = await _storage.read(key: _accessTokenKey);
      storedRefreshToken = await _storage.read(key: _refreshTokenKey);
      storedExpiration = await _storage.read(key: _expirationKey);
      if (kDebugMode) {
        print('Stored tokens: $storedAccessToken, $storedRefreshToken, $storedExpiration');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to read stored tokens: $e');
      }
    }

    if (storedAccessToken != null && storedRefreshToken != null && storedExpiration != null) {
      final expirationDate = DateTime.tryParse(storedExpiration);
      if (expirationDate != null) {
        if (isTokenExpired(expirationDate)) {
          final refreshedToken = await refreshToken(refreshToken: storedRefreshToken);
          add(RefreshCompleted(refreshedToken));
        } else {
          emit(AuthSuccess(
            accessToken: storedAccessToken,
            refreshToken: storedRefreshToken,
            expiration: expirationDate,
          ));
          return;
        }
      }
    }

    emit(const AuthInitial());
  }

  Future<void> _onRefreshCompleted(RefreshCompleted event, Emitter<AuthState> emit) async {
    emit(event.refreshedState);
  }

  Future<void> _storeToken(AccessTokenResponse token) async {
    final accessToken = token.accessToken ?? '';
    final refreshToken = token.refreshToken ?? '';
    final expiration = token.expirationDate?.toIso8601String() ?? '';

    try {
      await _storage.write(key: _accessTokenKey, value: accessToken);
      await _storage.write(key: _refreshTokenKey, value: refreshToken);
      await _storage.write(key: _expirationKey, value: expiration);
    } catch (e) {
      if (kDebugMode) {
        print('Failed to store tokens: $e');
      }
    }
  }

  Future<void> _clearStoredToken() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
    await _storage.delete(key: _expirationKey);
  }

  Future<AuthState> refreshToken({String? refreshToken}) async {
    if (refreshToken == null && state is! AuthSuccess) {
      return const AuthFailure('No valid refresh token available');
    }

    final currentRefreshToken = refreshToken ?? (state as AuthSuccess).refreshToken;
    final client = _createOAuth2Client();

    try {
      final token = await client.refreshToken(
        currentRefreshToken,
        clientId: AppConfig.apiUid,
      );

      await _storeToken(token);
      return _createAuthSuccessState(token);
    } catch (e) {
      return _createAuthFailureState(e);
    }
  }

  OAuth2Client _createOAuth2Client() {
    return OAuth2Client(
      authorizeUrl: AppConfig.authorizeUrl,
      tokenUrl: AppConfig.tokenUrl,
      redirectUri: AppConfig.redirectUri,
      customUriScheme: AppConfig.uriScheme,
    );
  }

  AuthState _createAuthFailureState(dynamic error) {
    if (error is DioException) {
      return AuthFailure('Network error: ${error.message}');
    } else if (error is OAuth2Exception) {
      return AuthFailure('OAuth error: ${error.error}');
    } else {
      return AuthFailure('An unknown error occurred: ${error.toString()}');
    }
  }

  AuthState _createAuthSuccessState(AccessTokenResponse token) {
    final accessToken = token.accessToken ?? '';
    final refreshToken = token.refreshToken ?? '';
    final expiration = token.expirationDate ?? DateTime(0);

    return AuthSuccess(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiration: expiration,
    );
  }
}
