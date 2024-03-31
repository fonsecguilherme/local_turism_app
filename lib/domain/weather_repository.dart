import 'package:local_turism/data/models/weather_model.dart';
import 'package:local_turism/data/http_client.dart';
import 'package:local_turism/data/http_exceptions.dart';

abstract class IWeatherRepository {
  Future<CityWeatherModel?> getCityWeather({
    required int woeid,
  });
}

class WeatherRepository extends IWeatherRepository {
  final IHttpClient client;

  WeatherRepository({required this.client});

  @override
  Future<CityWeatherModel?> getCityWeather({
    required int woeid,
  }) async {
    final String url = "https://api.hgbrasil.com/weather?woeid=$woeid";

    final response = await client.get(url: url);

    if (response.statusCode == 200) {
      return CityWeatherModel.fromJson(response.body);
    } else if (response.statusCode == 404) {
      throw NotFoundException(message: 'URL is not valid');
    } else {
      throw Exception('Could not obtain weather info');
    }
  }
}
