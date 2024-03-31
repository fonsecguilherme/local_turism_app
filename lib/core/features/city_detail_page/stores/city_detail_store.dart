import 'package:flutter/material.dart';
import 'package:local_turism/core/models/weather_model.dart';
import 'package:local_turism/data/http_exceptions.dart';
import 'package:local_turism/domain/weather_repository.dart';

class CityDetailStore {
  final IWeatherRepository repository;

  CityDetailStore({required this.repository});

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<CityWeatherModel?> state =
      ValueNotifier<CityWeatherModel?>(null);
  final ValueNotifier<String> error = ValueNotifier<String>('');

  Future getCityWeather({required int woeid}) async {
    isLoading.value = true;

    try {
      final result = await repository.getCityWeather(woeid: woeid);

      state.value = result;
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }
}
