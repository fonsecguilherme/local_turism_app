import 'package:flutter/material.dart';
import 'package:local_turism/routes/routes.dart';

import 'package:local_turism/core/commons/style.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Turismo Alagoas',
      debugShowCheckedModeBanner: false,
      theme: Style.appTheme,
      routerConfig: router,
    );
  }
}
