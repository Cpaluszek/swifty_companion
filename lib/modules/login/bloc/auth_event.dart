part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {}

class LogoutRequested extends AuthEvent {}

class InitRequested extends AuthEvent {}

class RefreshCompleted extends AuthEvent {
  final AuthState refreshedState;

  RefreshCompleted(this.refreshedState);

  @override
  List<Object?> get props => [refreshedState];
}
