import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/data/repository/city_repository.dart';
import 'package:local_turism/views/pages/home_page.dart';
import 'package:mocktail/mocktail.dart';

class MockCityRepository extends Mock implements CityRepository {}

late MockCityRepository cityRepository;

List<City> cities = [
  City(
    id: 1,
    cityKey: 'maceió',
    name: 'Maceió',
    mainImages: [
      "https://catracalivre.com.br/wp-content/uploads/sites/11/2016/02/1rd_Praia-de-Ponta-Verde_by_-Wesley-Menegari.jpg",
      "https://images.unsplash.com/photo-1632415978225-ffe0d0f2703e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=435&q=80",
      "https://catracalivre.com.br/wp-content/uploads/sites/11/2016/02/1rd_Praia-de-Ponta-Verde_by_-Wesley-Menegari.jpg"
    ],
    cityDescription: 'descrição',
    tags: [],
    cityFacts: [],
    extraImages: [],
  ),
  City(
    id: 2,
    cityKey: 'arapiraca',
    name: 'Arapi',
    mainImages: [
      "https://catracalivre.com.br/wp-content/uploads/sites/11/2016/02/1rd_Praia-de-Ponta-Verde_by_-Wesley-Menegari.jpg",
      "https://catracalivre.com.br/wp-content/uploads/sites/11/2016/02/1rd_Praia-de-Ponta-Verde_by_-Wesley-Menegari.jpg",
      "https://catracalivre.com.br/wp-content/uploads/sites/11/2016/02/1rd_Praia-de-Ponta-Verde_by_-Wesley-Menegari.jpg",
    ],
    cityDescription: 'descrição',
    tags: [],
    cityFacts: [],
    extraImages: [],
  ),
];

void main() {
  setUp(() {
    cityRepository = MockCityRepository();
  });

  testWidgets('Find city card widgets', (tester) async {
    when(() => cityRepository.getAll()).thenAnswer((_) => Future.value());

    await _createWidget(tester);

    
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
