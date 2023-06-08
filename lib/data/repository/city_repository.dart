import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:local_turism/data/model/city_model.dart';

class CityRepository {
  Future<CityModel?> getAll() async {
    const String url = 'https://raw.githubusercontent.com/fonsecguilherme/local_turism_app/master/cities.json';
  
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return CityModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }

  }
}