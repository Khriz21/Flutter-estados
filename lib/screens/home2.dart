import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_estados/bloc/user/user_bloc.dart';
import 'package:flutter_estados/models/user.dart';

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  static const String routerName = 'home2';

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
          title: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) =>
            state.existUser ? Text(state.user!.name) : const Text('Home2'),
      )),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              final newUser = User(
                  name: 'Cristan',
                  age: 26,
                  professions: ['Desarrollador', 'Programador']);
              userBloc.add(ActivateUser(newUser));
            },
            child: const Text(
              'Establecer usuario',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              userBloc.add(ChangeAge(20));
            },
            child: const Text(
              'Cambiar edad',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              userBloc.add(AddProfession());
            },
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
