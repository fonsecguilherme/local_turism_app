import 'package:flutter/material.dart';
import 'package:local_turism/data/repository/city_repository.dart';
import 'package:local_turism/style/style.dart';
import 'package:local_turism/views/pages/error_page.dart';
import 'package:local_turism/views/pages/home_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final CityRepository cityRepository = CityRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turismo Alagoas',
      debugShowCheckedModeBanner: false,
      theme: Style.appTheme,
      routes: {
        '/': (context) => HomePageWidget(repository: cityRepository),
        '/errorPage': (context) => ErrorPage(repository: cityRepository),
      },
    );
  }
}
