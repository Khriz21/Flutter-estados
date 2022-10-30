import 'dart:async';

import 'package:flutter_estados/models/user.dart' show User;

class _UserService {
  // ignore: avoid_init_to_null
  late User? _user = null;

  final StreamController<User> _userController =
      StreamController<User>.broadcast();

  User get user => _user!;

  bool get isUser => (_user != null) ? true : false;

  Stream<User> get userController => _userController.stream;

  void loadUser(User user) {
    _user = user;
    _userController.add(user);
  }

  void changeAge(int age) {
    _user!.age = age;
    _userController.add(_user!);
  }

  dispose() {
    _userController.close();
  }
}

final userService = _UserService();
