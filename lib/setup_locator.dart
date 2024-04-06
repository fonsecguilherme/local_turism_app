import 'package:get_it/get_it.dart';
import 'package:local_turism/core/features/city_detail_page/stores/city_detail_store.dart';
import 'package:local_turism/core/features/home_page/stores/home_page_store.dart';
import 'package:local_turism/data/http_client.dart';
import 'package:local_turism/domain/city_repository.dart';
import 'package:local_turism/domain/weather_repository.dart';

final dependency = GetIt.instance;

void setupLocator() {
  dependency.registerSingleton<HomePageStore>(
    HomePageStore(
      repository: CityRepository(client: HttpClient()),
    ),
  );

  dependency.registerLazySingleton<CityDetailStore>(
    () => CityDetailStore(
      repository: WeatherRepository(client: HttpClient()),
    ),
  );
}
