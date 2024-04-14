import 'package:get_it/get_it.dart';
import 'package:local_turism/core/features/city_detail_page/stores/city_detail_store.dart';
import 'package:local_turism/core/features/home_page/stores/home_page_store.dart';
import 'package:local_turism/data/http_client.dart';
import 'package:local_turism/domain/city_repository.dart';
import 'package:local_turism/domain/weather_repository.dart';

class ServiceLocator {
  final dependency = GetIt.instance;

  static ServiceLocator? _instance;

  //! garantindo que apenas *UMA* instancia do service
  //! locator será utilizada dentro do app

  static ServiceLocator get instance {
    _instance ??= ServiceLocator._();

    return _instance!;
  }

  ServiceLocator._() {
    initialize();
  }

  T get<T extends Object>() {
    return dependency.get<T>();
  }

  void initialize() {
    dependency.registerLazySingleton<IHttpClient>(
      () => HttpClient(),
    );

    dependency.registerLazySingleton<ICityRepository>(
      () => CityRepository(
        client: get<IHttpClient>(),
      ),
    );

    dependency.registerLazySingleton<IWeatherRepository>(
      () => WeatherRepository(
        client: get<IHttpClient>(),
      ),
    );

    dependency.registerLazySingleton<HomePageStore>(
      () => HomePageStore(
        repository: get<ICityRepository>(),
      ),
    );

    dependency.registerLazySingleton<CityDetailStore>(
      () => CityDetailStore(
        repository: get<IWeatherRepository>(),
      ),
    );
  }
}
