import 'package:flutter/material.dart';
import 'package:local_turism/core/models/city_model.dart';
import 'package:local_turism/data/http_exceptions.dart';
import 'package:local_turism/domain/city_repository.dart';

class HomePageStore {
  final ICityRepository repository;

  HomePageStore({
    required this.repository,
  });

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<CityModel> state =
      ValueNotifier<CityModel>(CityModel(cities: []));
  final ValueNotifier<String> error = ValueNotifier<String>('');

  Future getCities() async {
    isLoading.value = true;

    try {
      final result = await repository.getCities();

      if (result != null) {
        state.value = result;
      }
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}
