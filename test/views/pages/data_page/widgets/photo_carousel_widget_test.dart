import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/core/models/city_model.dart';
import 'package:local_turism/views/pages/data_page/widgets/photo_carousel_widget.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('Find carousel widgets such as photos and texts', (tester) async {
    await mockNetworkImagesFor(() => _createWidget(tester));

    expect(find.image(NetworkImage(_city.mainImages.first)), findsOneWidget);
    expect(find.byKey(const Key('carouselKey')), findsOneWidget);
    expect(find.byKey(const Key('dotsKey')), findsOneWidget);

    expect(find.text('Maceió'), findsOneWidget);
    expect(find.text('descrição'), findsOneWidget);
  });

  testWidgets('Find next image when swipe to left', (tester) async {
    await mockNetworkImagesFor(() => _createWidget(tester));

    expect(find.image(NetworkImage(_city.mainImages.first)), findsOneWidget);

    await tester.drag(find.byType(Stack), const Offset(-500, 0));

    await tester.pumpAndSettle();
    await tester.pump();

    expect(find.image(NetworkImage(_city.mainImages.elementAt(1))),
        findsOneWidget);

    await tester.drag(find.byType(Stack), const Offset(-500, 0));

    await tester.pumpAndSettle();
    await tester.pump();

    expect(find.image(NetworkImage(_city.mainImages.elementAt(2))),
        findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: PhotoCarouselWidget(
        city: _city,
      ),
    ),
  );
  await tester.pump();
}

City _city = City(
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
);
