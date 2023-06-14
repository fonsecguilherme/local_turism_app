import 'package:flutter/material.dart';
import 'package:local_turism/style/style.dart';
import 'package:local_turism/views/pages/error_page.dart';
import 'package:local_turism/views/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turismo Alagoas',
      debugShowCheckedModeBanner: false,
      theme: Style.appTheme,
      routes: {
        '/': (context) => const HomePageWidget(),
        '/errorScreen': (context) => const ErrorScreen(),
      },
    );
  }
}
