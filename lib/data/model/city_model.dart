// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

class CityModel {
    final List<City> cities;

    CityModel({
        required this.cities,
    });

    factory CityModel.fromRawJson(String str) => CityModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
    };
}

class City {
    final String name;
    final String mainImage;
    final List<String> cityFacts;
    final List<String> extraImages;

    City({
        required this.name,
        required this.mainImage,
        required this.cityFacts,
        required this.extraImages,
    });

    factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
        mainImage: json["main_image"],
        cityFacts: List<String>.from(json["city_facts"].map((x) => x)),
        extraImages: List<String>.from(json["extra_images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "main_image": mainImage,
        "city_facts": List<dynamic>.from(cityFacts.map((x) => x)),
        "extra_images": List<dynamic>.from(extraImages.map((x) => x)),
    };
}

