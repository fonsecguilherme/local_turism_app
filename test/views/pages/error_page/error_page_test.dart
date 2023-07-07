import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/commons/app_strings.dart';
import 'package:local_turism/data/repository/city_repository.dart';
import 'package:local_turism/views/pages/error_page/error_page.dart';
import 'package:mocktail/mocktail.dart';

class MockCityRepository extends Mock implements CityRepository {}

late CityRepository cityRepository;

void main() {
  setUp(() {
    cityRepository = MockCityRepository();
  });

  testWidgets('Find widgets for error page', (tester) async {
    await _createWidget(tester);

    final textMessage = find.text(AppStrings.errorMessage);
    final refreshButton = find.byType(ElevatedButton);

    expect(textMessage, findsOneWidget);
    expect(refreshButton, findsOneWidget);
  });

  //! TODO: refazer esse teste após conseguir migrar de widget para uma própria tela
  // testWidgets('When tap refresh button should make an api request',
  //     (tester) async {
  //   when(() => cityRepository.getAll()).thenAnswer((_) => Future.value());

  //   await _createWidget(tester);

  //   final refreshButton = find.byType(ElevatedButton);
  //   expect(refreshButton, findsOneWidget);

  //   await tester.tap(refreshButton);
  //   verify(() => cityRepository.getAll()).called(1);
  // });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: ErrorPage(cityRepository: cityRepository),
    ),
  );
}
