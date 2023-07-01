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
  final String cityKey;
  final String title;
  final String name;
  final List<String> mainImages;
  final String cityDescription;
  final List<String> tags;
  final List<CityFact> cityFacts;
  final List<String> extraImages;

  City({
    required this.id,
    required this.cityKey,
    required this.title,
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
        cityKey: json["city_key"],
        title: json["title"],
        name: json["name"],
        mainImages: List<String>.from(json["main_images"].map((x) => x)),
        cityDescription: json["city_description"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        cityFacts: List<CityFact>.from(
            json["city_facts"].map((x) => CityFact.fromJson(x))),
        extraImages: List<String>.from(json["extra_images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city_key": cityKey,
        "title": title,
        "name": name,
        "main_images": List<dynamic>.from(mainImages.map((x) => x)),
        "city_description": cityDescription,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "city_facts": List<dynamic>.from(cityFacts.map((x) => x.toJson())),
        "extra_images": List<dynamic>.from(extraImages.map((x) => x)),
      };
}

class CityFact {
  final String title;
  final String description;
  final String image;

  CityFact({
    required this.title,
    required this.description,
    required this.image,
  });

  factory CityFact.fromRawJson(String str) =>
      CityFact.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CityFact.fromJson(Map<String, dynamic> json) => CityFact(
        title: json["title"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "image": image,
      };
}
