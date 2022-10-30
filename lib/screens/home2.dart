import 'package:flutter/material.dart';
import 'package:flutter_estados/models/user.dart';
import 'package:flutter_estados/services/user_service.dart';

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  static const String routerName = 'home2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userController,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? Text(snapshot.data!.name)
                : const Text('Nombre de usuario');
          },
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              final newUser =
                  User(name: 'Cristian', age: 29, professions: ["programador"]);
              userService.loadUser(
                newUser,
              );
            },
            child: const Text(
              'Establecer usuario',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              userService.changeAge(30);
            },
            child: const Text(
              'Cambiar edad',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {},
            child: const Text(
              'Camniar profesión',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      )),
    );
  }
}
