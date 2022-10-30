import 'package:flutter/material.dart';
import 'package:flutter_estados/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  HomeScreen.routerName: (_) => const HomeScreen(),
  Home2.routerName: (_) => const Home2(),
};
