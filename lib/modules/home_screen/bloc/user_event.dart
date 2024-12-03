part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchProfileRequested extends UserEvent {}

class FetchProfileByUsername extends UserEvent {
  final String username;

  FetchProfileByUsername(this.username);
}

class ClearSearchedUser extends UserEvent {}
