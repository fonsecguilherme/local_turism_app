import 'package:local_turism/core/models/city_model.dart';
import 'package:local_turism/data/http_client.dart';
import 'package:local_turism/data/http_exceptions.dart';

abstract class ICityRepository {
  Future<CityModel?> getCities();
}

class CityRepository implements ICityRepository {
  final HttpClient client;

  CityRepository({required this.client});

  @override
  Future<CityModel?> getCities() async {
    const String url =
        'https://raw.githubusercontent.com/fonsecguilherme/local_turism_app/master/cities.json';

    final response = await client.get(url: url);

    if (response.statusCode == 200) {
      return CityModel.fromRawJson(response.body);
    } else if (response.statusCode == 404) {
      throw NotFoundException(message: 'URL is not valid');
    } else {
      throw Exception('Could not obtain cities info');
    }
  }
}
