import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_users_usecase.dart';

import '../../../domain/entities/user_entity.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUsersUsecase getUsersUsecase;
  UserCubit({
    required this.getUsersUsecase,
  }) : super(UserInitial());

  Future<void> getUsers() async {
    try {
      final user = getUsersUsecase.call();
      user.listen((users) {
        emit(UserLoaded(users: users));
      });
    } on SocketException catch (_) {}
  }
}
