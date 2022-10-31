part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final User? user;

  const UserState({this.existUser = false, this.user});
}

class UserInitial extends UserState {
  const UserInitial() : super();
}

class UserSetState extends UserState {
  final User newUser;

  const UserSetState(
    this.newUser,
  ) : super(existUser: true, user: newUser);
}
