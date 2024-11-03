import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {}

class LogoutRequested extends AuthEvent {}

class InitRequested extends AuthEvent {}
