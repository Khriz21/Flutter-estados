import 'package:flutter/material.dart';
import 'package:flutter_estados/models/user.dart';
import 'package:flutter_estados/screens/screens.dart';
import 'package:flutter_estados/services/user_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routerName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inicio")),
      body: StreamBuilder(
        stream: userService.userController,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? UserInformation(userService.user)
              : const Center(
                  child: Text('No hay informacion'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Home2.routerName),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation(this.user, {super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Nombre: ${user.name} '),
          ),
          ListTile(
            title: Text('Edad: ${user.age} '),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Profesión 1: ${user.professions[0]}'),
          ),
          const ListTile(
            title: Text('Profesión 2: '),
          ),
          const ListTile(
            title: Text('Profesión 3: '),
          ),
        ],
      ),
    );
  }
}
