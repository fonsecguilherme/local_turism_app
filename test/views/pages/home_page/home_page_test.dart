import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/core/commons/app_strings.dart';
import 'package:local_turism/core/features/home_page/home_page.dart';
import 'package:local_turism/core/features/home_page/widgets/success_widget.dart';
import 'package:local_turism/core/features/widgets/drawer_widget.dart';
import 'package:local_turism/data/models/city_model.dart';
import 'package:local_turism/domain/city_repository.dart';
import 'package:local_turism/core/features/widgets/error_page.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockCityRepository extends Mock implements CityRepository {}

late CityRepository cityRepository;

void main() {
  setUp(() {
    cityRepository = MockCityRepository();
  });

  testWidgets('Find appBar drawer', (tester) async {
    when(() => cityRepository.getCities()).thenAnswer((_) => Future.value());

    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      drawer: DrawerWidget(),
    )));

    await tester.dragFrom(
        tester.getTopLeft(find.byType(MaterialApp)), const Offset(300, 0));
    await tester.pumpAndSettle();
  });

  testWidgets('Fin appbar text', (tester) async {
    when(() => cityRepository.getCities()).thenAnswer((_) => Future.value());

    await _createWidget(tester);

    expect(find.text(AppStrings.appBarText), findsOneWidget);
  });

  testWidgets('Find data page widget', (tester) async {
    final cityModel = CityModel(cities: _cities);

    when(() => cityRepository.getCities()).thenAnswer(
      (_) => Future.value(cityModel),
    );

    await mockNetworkImagesFor(() => _createWidget(tester));

    final dataWidget = find.byType(SuccessWidget);

    await tester.pump();

    expect(dataWidget, findsOneWidget);
  });

  testWidgets('Test error screen widget', (tester) async {
    when(() => cityRepository.getCities()).thenThrow(Exception());

    await tester.pumpWidget(
      MaterialApp(
        home: ErrorPage(cityRepository: cityRepository),
      ),
    );

    final errorWidget = find.byType(ErrorPage);

    expect(errorWidget, findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: HomePageWidget(
          cityRepository: cityRepository,
        ),
      ),
    ),
  );
  await tester.pump();
}

final List<City> _cities = [
  City(
    id: 1,
    cityKey: '',
    title: '',
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
    woeid: 12345,
  ),
  City(
    id: 2,
    cityKey: '',
    title: '',
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
    woeid: 12345,
  ),
];
