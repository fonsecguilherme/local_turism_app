import 'package:go_router/go_router.dart';
import 'package:local_turism/core/features/city_detail_page/city_detail_page.dart';
import 'package:local_turism/data/models/city_model.dart';
import 'package:local_turism/data/http_client.dart';
import 'package:local_turism/domain/city_repository.dart';
import 'package:local_turism/core/features/widgets/error_page.dart';
import 'package:local_turism/core/features/home_page/home_page.dart';

final ICityRepository cityRepository = CityRepository(
  client: HttpClient(),
);

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
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
      builder: (context, state) {
        return ErrorPage(cityRepository: cityRepository);
      },
    ),
  ],
);
