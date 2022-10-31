import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estados/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(InitialUser());

  void selectUser(User user) {
    emit(ActiveUser(user));
  }

  set changeAge(int age) {
    final currentState = state;

    if (currentState is ActiveUser) {
      final newUser = currentState.user.copyWith(age: age);
      emit(ActiveUser(newUser));
    }
  }

  void addProf() {
    final currentState = state;

    if (currentState is ActiveUser) {
      final professions = [
        ...currentState.user.professions,
        'Profesion ${currentState.user.professions.length + 1}'
      ];
      final newUser = currentState.user.copyWith(professions: professions);
      emit(ActiveUser(newUser));
    }
  }

  void deleteUser() => emit(InitialUser());
}
