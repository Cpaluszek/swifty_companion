part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = UserInitial;
  const factory UserState.loading() = UserLoading;
  const factory UserState.loaded(UserModel user) = UserLoaded;
  const factory UserState.error(String error) = UserError;
}
