import 'package:http/http.dart' as http;
import 'package:local_turism/data/models/weather_model.dart';

class WeatherRepository {
  Future<CityWeatherModel> getCityWeather({required int woeid}) async {
    final String url = "https://api.hgbrasil.com/weather?woeid=$woeid";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return CityWeatherModel.fromJson(response.body);
    } else {
      throw Exception('Would not obtain weather info');
    }
  }
}
