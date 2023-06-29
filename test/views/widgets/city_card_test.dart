import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/views/widgets/city_card.dart';
import 'package:local_turism/views/widgets/photo_carousel_widget.dart';
import 'package:local_turism/views/widgets/tag_item.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets(
      'Must find initial picture, city name and city description and tags',
      (tester) async {
    await mockNetworkImagesFor(() => _createWidget(tester));

    final carouselWidget = find.byType(PhotoCarouselWidget);
    final tagsWidget = find.byType(TagItemWidget);

    expect(carouselWidget, findsOneWidget);
    expect(tagsWidget, findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(
    home: CityCard(city: _city),
  ));

  await tester.pump();
}

City _city = City(
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
);
