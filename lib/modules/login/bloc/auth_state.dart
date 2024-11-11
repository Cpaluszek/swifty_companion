part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.success({
    required String accessToken,
    required String refreshToken,
    required DateTime expiration,
  }) = AuthSuccess;
  const factory AuthState.failure(String error) = AuthFailure;
}
