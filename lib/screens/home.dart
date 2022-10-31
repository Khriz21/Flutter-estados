import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_estados/bloc/user/user_cubit.dart';
import 'package:flutter_estados/models/user.dart';
import 'package:flutter_estados/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routerName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 1'),
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app_outlined),
          onPressed: () => context.read<UserCubit>().deleteUser(),
        ),
      ),
      body: const ScaffoldBody(),
      //
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

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case InitialUser:
            return const Center(child: Text('No hay informacion del usuario'));

          case ActiveUser:
            return UserInformation((state as ActiveUser).user);

          default:
            return const Center();
        }
      },
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation(
    this.user, {
    Key? key,
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
              .map((profession) => ListTile(
                    title: Text(profession),
                  ))
              .toList()
        ],
      ),
    );
  }
}
