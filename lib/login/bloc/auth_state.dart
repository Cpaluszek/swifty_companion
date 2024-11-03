import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String accessToken;
  final String refreshToken;
  final DateTime expiration;

  const AuthSuccess({
    required this.accessToken,
    required this.refreshToken,
    required this.expiration,
  });

  @override
  List<Object> get props => [accessToken, refreshToken, expiration];
}

class AuthFailure extends AuthState {
  final String error;

  const AuthFailure(this.error);

  @override
  List<Object> get props => [error];
}
