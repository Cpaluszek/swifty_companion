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

class UserBloc extends Bloc<UserEvent, UserState> {
  final Dio dio;
  late final UserRepositoryImpl userRepositoryImpl;

  UserBloc({required this.dio}) : super(const UserInitial()) {
    userRepositoryImpl = UserRepositoryImpl(dio: dio);
    on<FetchProfileRequested>(_fetchProfileRequested);
  }

  Future<void> _fetchProfileRequested(FetchProfileRequested event, Emitter<UserState> emit) async {
    emit(const UserLoading());
    try {
      final user = await userRepositoryImpl.getMe();
      emit(UserLoaded(user));
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user data: ${e.toString()}');
      }
      emit(UserError(e.toString()));
    }
  }
}
