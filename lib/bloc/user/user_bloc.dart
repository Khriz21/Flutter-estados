import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));

    on<ChangeAge>((event, emit) {
      if (!state.existUser) return;
      final newUser = state.user!.copyWith(age: event.age);
      emit(UserSetState(newUser));
    });

    on<AddProfession>((event, emit) {
      if (!state.existUser) return;

      final professions = [
        ...state.user!.professions,
        'Profesión: ${state.user!.professions.length + 1}'
      ];

      emit(UserSetState(state.user!.copyWith(professions: professions)));
    });

    on<Logout>((event, emit) => emit(const UserInitial()));
  }
}
