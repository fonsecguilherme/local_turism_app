import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/commons/app_strings.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/data/repository/city_repository.dart';
import 'package:local_turism/views/pages/data_page.dart';
import 'package:local_turism/views/pages/error_page.dart';
import 'package:local_turism/views/pages/home_page.dart';
import 'package:local_turism/views/pages/loading_page.dart';
import 'package:mocktail/mocktail.dart';

class MockCityRepository extends Mock implements CityRepository {}

late CityRepository cityRepository;

void main() {
  setUp(() {
    cityRepository = MockCityRepository();
  });

  testWidgets('Find appBar widgets', (tester) async {
    when(() => cityRepository.getAll()).thenAnswer((_) => Future.value());

    await _createWidget(tester);

    expect(find.text(AppStrings.appBarText), findsOneWidget);
    expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
  });

  testWidgets('Find data page widget', (tester) async {
    when(() => cityRepository.getAll()).thenAnswer(
      (_) async => Future.value(
          //CityModel(cities: cities),
          ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: DataPage(
          cities: cities,
        ),
      ),
    );

    final dataWidget = find.byType(DataPage, skipOffstage: false);
    expect(dataWidget, findsOneWidget);
  });

  testWidgets('Find loading page widget', (tester) async {
    when(() => cityRepository.getAll()).thenAnswer(
        (_) => Future.delayed(const Duration(seconds: 1), () => null));

    await tester.pumpWidget(
      const MaterialApp(
        home: LoadingPage(),
      ),
    );

    expect(find.byType(LoadingPage, skipOffstage: false), findsOneWidget);
  });

  testWidgets('Test error screen widget', (tester) async {
    when(() => cityRepository.getAll()).thenThrow(Exception());

    await tester.pumpWidget(
      const MaterialApp(
        home: ErrorScreen(),
      ),
    );

    final errorWidget = find.byType(ErrorScreen);

    expect(errorWidget, findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: HomePageWidget(
        repository: cityRepository,
      ),
    ),
  );
  await tester.pump();
}

final List<City> cities = [
  City(
    id: 1,
    cityKey: '',
    name: 'Maceió',
    mainImages: [
      "https://catracalivre.com.br/wp-content/uploads/sites/11/2016/02/1rd_Praia-de-Ponta-Verde_by_-Wesley-Menegari.jpg",
      "https://images.unsplash.com/photo-1632415978225-ffe0d0f2703e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=435&q=80",
      "https://catracalivre.com.br/wp-content/uploads/sites/11/2016/02/1rd_Praia-de-Ponta-Verde_by_-Wesley-Menegari.jpg",
    ],
    cityDescription: '',
    tags: [],
    cityFacts: [],
    extraImages: [],
  ),
  City(
    id: 2,
    cityKey: '',
    name: 'Arapiraca',
    mainImages: [
      "https://catracalivre.com.br/wp-content/uploads/sites/11/2016/02/1rd_Praia-de-Ponta-Verde_by_-Wesley-Menegari.jpg",
      "https://images.unsplash.com/photo-1632415978225-ffe0d0f2703e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=435&q=80",
      "https://catracalivre.com.br/wp-content/uploads/sites/11/2016/02/1rd_Praia-de-Ponta-Verde_by_-Wesley-Menegari.jpg"
    ],
    cityDescription: '',
    tags: [],
    cityFacts: [],
    extraImages: [],
  ),
];
