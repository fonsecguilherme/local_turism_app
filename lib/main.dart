import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_turism/data/repository/city_repository.dart';
import 'package:local_turism/style/style.dart';
import 'package:local_turism/views/pages/error_page.dart';
import 'package:local_turism/views/pages/home_page.dart';

void main() => runApp(const MainApp());

final CityRepository _cityRepository = CityRepository();

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePageWidget(
          repository: _cityRepository,
        );
      },
    ),
    GoRoute(
      name: 'errorPage',
      path: '/errorPage',
      builder: (BuildContext context, GoRouterState state) {
        return ErrorPage(
          repository: _cityRepository,
        );
      },
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Turismo Alagoas',
      debugShowCheckedModeBanner: false,
      theme: Style.appTheme,
      routerConfig: _router,
    );
  }
}
