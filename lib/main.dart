import 'package:flutter/material.dart';

import 'package:flutter_estados/routes/routes.dart';
import 'package:flutter_estados/screens/screens.dart';
import 'package:flutter_estados/services/user_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UseerService(),
      child: MaterialApp(
        title: 'Flutter estados',
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routerName,
        routes: routes,
      ),
    );
  }
}
