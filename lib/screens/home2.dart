import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_estados/bloc/user/user_cubit.dart';
import 'package:flutter_estados/models/user.dart';

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  static const String routerName = 'home2';

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case InitialUser:
                return const Text('Ajustes');

              case ActiveUser:
                return Text((state as ActiveUser).user.name);
              default:
                return const Text('Ajustes');
            }
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
              final newUser = User(
                  name: 'Cristian',
                  age: 29,
                  professions: ['jr developper', 'gamer']);
              userCubit.selectUser(newUser);
            },
            child: const Text(
              'Establecer usuario',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              userCubit.changeAge = 24;
            },
            child: const Text(
              'Cambiar edad',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              userCubit.addProf();
            },
            child: const Text(
              'Agregar profesion',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      )),
    );
  }
}
