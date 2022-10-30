import 'package:flutter/material.dart';

import 'package:flutter_estados/routes/routes.dart';
import 'package:flutter_estados/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter estados',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routerName,
      routes: routes,
    );
  }
}
