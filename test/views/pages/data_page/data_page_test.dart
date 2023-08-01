import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/data/models/city_model.dart';
import 'package:local_turism/views/pages/data_page/data_page.dart';
import 'package:local_turism/views/pages/data_page/widgets/city_card.dart';
import 'package:network_image_mock/network_image_mock.dart';

List<City> _cities = [
  City(
    id: 1,
    cityKey: 'maceió',
    title: '',
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
    woeid: 12345,
  ),
  City(
    id: 2,
    cityKey: 'arapiraca',
    title: '',
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
    woeid: 12345,
  ),
];

void main() {
  testWidgets('Find city card widgets', (tester) async {
    await mockNetworkImagesFor(() => _createWidget(tester));

    final listViewWidget = find.byKey(const Key('listViewKey'));

    expect(listViewWidget, findsOneWidget);

    expect(find.byType(CityCard), findsNWidgets(2));

    final maceioKey = find.byKey(const Key('maceió'));
    final arapiracaKey = find.byKey(const Key('arapiraca'));

    expect(maceioKey, findsOneWidget);
    expect(arapiracaKey, findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: DataPage(
        cities: _cities,
      ),
    ),
  );
  await tester.pump();
}
