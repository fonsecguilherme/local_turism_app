import 'package:flutter/material.dart';
import 'package:local_turism/core/features/city_detail_page/widgets/city_temperature_widget.dart';
import 'package:local_turism/core/features/city_detail_page/widgets/loading_temperature_widget.dart';
import 'package:local_turism/core/models/weather_model.dart';
import 'package:local_turism/data/http_client.dart';
import 'package:local_turism/domain/weather_repository.dart';

class TemperatureWidget extends StatefulWidget {
  final WeatherRepository _weatherRepository;
  final int woeid;

  static const loadingWidgetKey = Key('loadingWidgetKey');
  static const temperatureKey = Key('temperatureKey');

  TemperatureWidget(
      {super.key, WeatherRepository? weatherRepository, required this.woeid})
      : _weatherRepository = weatherRepository ??
            WeatherRepository(
              client: HttpClient(),
            );

  @override
  State<TemperatureWidget> createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  late Future<CityWeatherModel?> weatherData;

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
            return CityTemperatureWidget(degrees: degrees);
          } else if (snapshot.hasError) {
            return const Icon(Icons.error_outline_rounded);
          } else {
            return const LoadingTemperatureWidget();
          }
        },
      );
}
