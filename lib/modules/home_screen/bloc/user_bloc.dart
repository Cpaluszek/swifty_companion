import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swifty_companion/core/model/user_model.dart';
import 'package:swifty_companion/core/repository/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

abstract class BaseUserBloc extends Bloc<UserEvent, UserState> {
  final Dio dio;
  late final UserRepositoryImpl userRepositoryImpl;

  BaseUserBloc({required this.dio}) : super(const UserInitial()) {
    userRepositoryImpl = UserRepositoryImpl(dio: dio);
  }

  Future<void> _fetchProfileRequested(FetchProfileRequested event, Emitter<UserState> emit) async {
    emit(const UserLoading());
    try {
      final user = await userRepositoryImpl.getMe();
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _fetchProfileByUsername(FetchProfileByUsername event, Emitter<UserState> emit) async {
    emit(const UserLoading());
    try {
      final user = await userRepositoryImpl.getUserByUsername(event.username);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}

class UserBloc extends BaseUserBloc {
  UserBloc({required super.dio}) {
    on<FetchProfileRequested>(_fetchProfileRequested);
  }
}

class SearchedUserBloc extends BaseUserBloc {
  SearchedUserBloc({required super.dio}) {
    on<FetchProfileByUsername>(_fetchProfileByUsername);
    on<ClearSearchedUser>((event, emit) {
      emit(const UserInitial());
    });
  }
}
