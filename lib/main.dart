import 'package:flutter/material.dart';
import 'package:local_turism/app.dart';
import 'package:local_turism/setup_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    const MainApp(),
  );
}
