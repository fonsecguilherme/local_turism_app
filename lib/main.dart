import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_turism/data/models/city_model.dart';
import 'package:local_turism/data/repository/city_repository.dart';
import 'package:local_turism/style/style.dart';
import 'package:local_turism/views/pages/city_detail_page/city_detail_page.dart';
import 'package:local_turism/views/pages/error_page/error_page.dart';
import 'package:local_turism/views/pages/home_page/home_page.dart';

void main() => runApp(const MainApp());

final CityRepository _cityRepository = CityRepository();

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePageWidget();
      },
      routes: [
        GoRoute(
          path: 'detailScreen',
          builder: (context, state) {
            City city = state.extra as City;
            return CityDetailPage(city: city);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/errorPage',
      builder: (BuildContext context, GoRouterState state) {
        return ErrorPage(cityRepository: _cityRepository);
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
