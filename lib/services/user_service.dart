import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:flutter_estados/models/user.dart';

class UseerService extends ChangeNotifier {
  User? _user;

  bool get isUser => (_user != null) ? true : false;

  User get user => _user!;

  void loadUser(User user) {
    _user = user;
    notifyListeners();
  }

  set changeAge(int age) {
    _user!.age = age;
    notifyListeners();
  }
}
