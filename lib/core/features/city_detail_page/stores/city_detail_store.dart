import 'package:flutter/material.dart';
import 'package:local_turism/core/features/city_detail_page/temperature_widget_state.dart';
import 'package:local_turism/data/http_exceptions.dart';
import 'package:local_turism/domain/weather_repository.dart';

class CityDetailStore extends ValueNotifier<TemperatureWidgetState> {
  final IWeatherRepository repository;

  CityDetailStore({required this.repository})
      : super(LoadingTemperatureWidgetState());

  Future getCityWeather({required int woeid}) async {
    try {
      final result = await repository.getCityWeather(woeid: woeid);

      if (result != null) {
        value = FetchedTemperatureWidgetState(
          temperature: result.results,
        );
      }
    } on NotFoundException catch (e) {
      value = ErrorTemperatureWidgetState(
        errorMessage: e.message,
      );
    } catch (e) {
      value = ErrorTemperatureWidgetState(
        errorMessage: e.toString(),
      );
    }
  }
}
