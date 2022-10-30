import 'package:flutter/material.dart';
import 'package:flutter_estados/models/user.dart';
import 'package:flutter_estados/screens/screens.dart';
import 'package:flutter_estados/services/user_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routerName = 'home';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UseerService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 1'),
      ),
      body: userProvider.isUser
          ? _UserInformation(
              user: userProvider.user,
            )
          : const Center(
              child: Text('No hay usuario'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          Home2.routerName,
        ),
        child: const Icon(Icons.person_add_alt),
      ),
    );
  }
}

class _UserInformation extends StatelessWidget {
  const _UserInformation({
    Key? key,
    required this.user,
  }) : super(key: key);

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
            title: Text('Nombre: ${user.name}'),
          ),
          ListTile(
            title: Text('Edad: ${user.age}'),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: user.professions.length,
              itemBuilder: (context, i) => ListTile(
                title: Text(user.professions[i]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
