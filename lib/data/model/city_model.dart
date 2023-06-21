// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

class CityModel {
  final List<City> cities;

  CityModel({
    required this.cities,
  });

  factory CityModel.fromRawJson(String str) =>
      CityModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class City {
  final int id;
  final String key;
  final String name;
  final List<String> mainImages;
  final String cityDescription;
  final List<String> tags;
  final List<String> cityFacts;
  final List<String> extraImages;

  City({
    required this.id,
    required this.key,
    required this.name,
    required this.mainImages,
    required this.cityDescription,
    required this.tags,
    required this.cityFacts,
    required this.extraImages,
  });

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        key: json["key"],
        name: json["name"],
        mainImages: List<String>.from(json["main_images"].map((x) => x)),
        cityDescription: json["city_description"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        cityFacts: List<String>.from(json["city_facts"].map((x) => x)),
        extraImages: List<String>.from(json["extra_images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "name": name,
        "main_images": List<dynamic>.from(mainImages.map((x) => x)),
        "city_description": cityDescription,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "city_facts": List<dynamic>.from(cityFacts.map((x) => x)),
        "extra_images": List<dynamic>.from(extraImages.map((x) => x)),
      };
}
