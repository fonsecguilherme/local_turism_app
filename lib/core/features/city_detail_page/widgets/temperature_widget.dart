import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:local_turism/core/features/city_detail_page/stores/city_detail_store.dart';
import 'package:local_turism/core/features/city_detail_page/widgets/city_temperature_widget.dart';
import 'package:local_turism/domain/weather_repository.dart';

class TemperatureWidget extends StatefulWidget {
  final int woeid;

  static const loadingWidgetKey = Key('loadingWidgetKey');
  static const temperatureKey = Key('temperatureKey');

  const TemperatureWidget({
    super.key,
    WeatherRepository? weatherRepository,
    required this.woeid,
  });

  @override
  State<TemperatureWidget> createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  late CityDetailStore store;

  @override
  void initState() {
    super.initState();
    final getIt = GetIt.instance;

    store = getIt<CityDetailStore>();

    store.getCityWeather(woeid: widget.woeid);
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: Listenable.merge([
          store.isLoading,
          store.error,
          store.state,
        ]),
        builder: (context, child) {
          if (store.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (store.error.value.isNotEmpty) {
            return const Text('X');
          } else {
            final degrees = store.state.value?.results.temp ?? 0;
            return CityTemperatureWidget(degrees: degrees);
          }
        },
      );
}
