import 'package:local_turism/data/models/weather_model.dart';

abstract class TemperatureWidgetState {}

class LoadingTemperatureWidgetState extends TemperatureWidgetState {}

class ErrorTemperatureWidgetState extends TemperatureWidgetState {
  final String errorMessage;

  ErrorTemperatureWidgetState({required this.errorMessage});
}

class FetchedTemperatureWidgetState extends TemperatureWidgetState {
  final Results temperature;

  FetchedTemperatureWidgetState({required this.temperature});
}
