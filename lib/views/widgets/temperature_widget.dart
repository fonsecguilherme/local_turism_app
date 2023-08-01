import 'package:flutter/material.dart';
import 'package:local_turism/commons/app_strings.dart';
import 'package:local_turism/data/models/weather_model.dart';
import 'package:local_turism/data/repository/weather_repository.dart';
import 'package:local_turism/style/style.dart';

class TemperatureWidget extends StatefulWidget {
  final WeatherRepository _weatherRepository;
  final int woeid;

  TemperatureWidget(
      {super.key, WeatherRepository? weatherRepository, required this.woeid})
      : _weatherRepository = weatherRepository ?? WeatherRepository();

  @override
  State<TemperatureWidget> createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  late Future<CityWeatherModel> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = widget._weatherRepository.getCityWeather(
      woeid: widget.woeid,
    );
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<CityWeatherModel?>(
        future: weatherData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final degrees = snapshot.data!.results.temp;
            return _cityTemperature(degrees);
          } else if (snapshot.hasError) {
            return const Icon(Icons.error_outline_rounded);
          } else {
            return _loadingWidget();
          }
        },
      );

  Widget _cityTemperature(int degrees) => Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Center(
          child: Text(
            '$degrees${AppStrings.degreesCelsiusText}',
            style: Style.appBarTemperatureTextStyle,
          ),
        ),
      );

  Widget _loadingWidget() => const Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
