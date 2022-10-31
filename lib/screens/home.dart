import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_estados/screens/screens.dart';

import '../bloc/user/user_bloc.dart';
import '../models/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routerName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => BlocProvider.of<UserBloc>(context).add(Logout()),
          icon: const Icon(Icons.exit_to_app_outlined),
        ),
        title: const Text('Pantalla 1'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) => state.existUser
            ? UserInformation(
                user: state.user!,
              )
            : const Center(
                child: Text('No hay informacion del usuario'),
              ),
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

class UserInformation extends StatelessWidget {
  const UserInformation({
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
          ...user.professions
              .map(
                (profession) => ListTile(
                  title: Text(profession),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
