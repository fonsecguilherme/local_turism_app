import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/core/commons/app_strings.dart';
import 'package:local_turism/core/features/city_detail_page/widgets/city_temperature_widget.dart';
import 'package:local_turism/core/features/city_detail_page/widgets/loading_temperature_widget.dart';
import 'package:local_turism/core/features/city_detail_page/widgets/temperature_widget.dart';
import 'package:local_turism/data/models/weather_model.dart';
import 'package:local_turism/domain/weather_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

late WeatherRepository weatherRepository;

void main() {
  setUp(() {
    weatherRepository = MockWeatherRepository();
  });

  testWidgets('Find city temperature after API successful return',
      (tester) async {
    final cityWeather = CityWeatherModel(
      results: Results(
        temp: 20,
        date: DateTime(0),
        time: '',
        description: '',
        imgId: '',
        humidity: 0,
        cloudiness: 0.0,
        rain: 0.0,
        windSpeedy: '',
        cityName: 'cityName',
        sunrise: '',
        sunset: '',
        currently: '',
        windDirection: 0,
        forecast: [],
      ),
    );

    final int degrees = cityWeather.results.temp;

    when(() => weatherRepository.getCityWeather(woeid: 455827))
        .thenAnswer((_) => Future.value(cityWeather));

    await tester.pumpWidget(
      MaterialApp(
        home: CityTemperatureWidget(degrees: degrees),
      ),
    );

    expect(
        find.text('$degrees${AppStrings.degreesCelsiusText}'), findsOneWidget);
  });

  testWidgets('Find loading widget while await for API return', (tester) async {
    when(() => weatherRepository.getCityWeather(woeid: 455827))
        .thenAnswer((_) => Future.delayed(const Duration(seconds: 1)));

    await tester.pumpWidget(
      const MaterialApp(
        home: LoadingTemperatureWidget(),
      ),
    );

    expect(find.byType(LoadingTemperatureWidget), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets("Find error widget when API returns an exception",
      (tester) async {
    when(() => weatherRepository.getCityWeather(woeid: 123))
        .thenThrow(Exception());

    await _createWidget(tester);

    expect(find.byIcon(Icons.error_outline_rounded), findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: TemperatureWidget(
        woeid: 455827,
      ),
    ),
  );
  await tester.pump();
}
