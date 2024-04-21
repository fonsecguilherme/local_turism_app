import 'package:flutter/material.dart';
import 'package:local_turism/core/features/city_detail_page/stores/city_detail_store.dart';
import 'package:local_turism/core/features/city_detail_page/temperature_widget_state.dart';
import 'package:local_turism/core/features/city_detail_page/widgets/city_temperature_widget.dart';
import 'package:local_turism/domain/weather_repository.dart';
import 'package:local_turism/service_locator.dart';

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

    store = ServiceLocator.instance.get<CityDetailStore>();

    store.getCityWeather(woeid: widget.woeid);
  }

  //! criar a classes states tatno da tela home
  //! quanto dessa classe aqui. Porque dá pra usar como se fosse no bloc
  //! se o estadofor tal, eu retorno determinado widget

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: store,
        builder: (context, value, child) {
          if (value is ErrorTemperatureWidgetState) {
            return const Text('X');
          } else if (value is FetchedTemperatureWidgetState) {
            final degrees = value.temperature.temp;
            return CityTemperatureWidget(degrees: degrees);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
}
