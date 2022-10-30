import 'package:flutter/material.dart';
import 'package:flutter_estados/models/user.dart';
import 'package:flutter_estados/services/user_service.dart';
import 'package:provider/provider.dart';

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  static const String routerName = 'home2';

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UseerService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: userService.isUser
            ? Text(userService.user.name)
            : const Text('Pantalla 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              final newUser = User(
                name: 'Cristian',
                age: 27,
                professions: ['Contador', 'programador'],
              );

              userService.loadUser(newUser);
            },
            child: const Text(
              'Establecer usuario',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () => userService.changeAge = 25,
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
