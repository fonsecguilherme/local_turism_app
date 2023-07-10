import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/data/model/city_model.dart';
import 'package:local_turism/views/pages/city_detail_page/city_detail_page.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets(
    'Find inital widgets',
    (tester) async {
      await mockNetworkImagesFor(() => _createWidget(tester));

      final appBarKey = find.byKey(CityDetailPage.appBarKey);
      final cityFactKey = find.byKey(CityDetailPage.cityFactKey);
      final bottomWidgetKey = find.byKey(CityDetailPage.bottomWidgetKey);

      expect(appBarKey, findsOneWidget);
      expect(cityFactKey, findsNWidgets(4));
      expect(bottomWidgetKey, findsOneWidget);
    },
  );

  testWidgets("Find expanded image widget after long press", (tester) async {
    await mockNetworkImagesFor(() => _createWidget(tester));

    final photo = find.byKey(const Key('photo0'));

    await tester.ensureVisible(photo);
    await tester.pump();
    await tester.longPress(photo);

    expect(find.byKey(CityDetailPage.expandedImageKey), findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: CityDetailPage(city: city),
    ),
  );

  await tester.pump();
}

City city = City(
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
  cityFacts: [
    CityFact(
      title: '"Praia de Pajuçara",',
      description: 'descrição',
      image:
          'https://maceioatlantic.com/wp-content/uploads/elementor/thumbs/praia_pajucara-pbwfq8usb3i43cif18kc20ev8wj0ewc7k0op1nbudw.jpg',
    ),
    CityFact(
      title: "Beirro histórico de Jaraguá",
      description: 'descrição',
      image:
          'https://maceioatlantic.com/wp-content/uploads/elementor/thumbs/praia_pajucara-pbwfq8usb3i43cif18kc20ev8wj0ewc7k0op1nbudw.jpg',
    ),
  ],
  extraImages: [
    "http://experimentemaceio.com.br/wp-content/uploads/2022/05/17-11-2021-Artesanato-Pajucara-Turismo-SEMTEL-Por-Emile-Valoes_3.jpg",
    "http://experimentemaceio.com.br/wp-content/uploads/2022/05/18-12-21-cortejo-natal-dos-Folguedos-natal-de-todos-Nos-FMAC-fotos-Barbara-Wanderley-65.jpg",
    "http://experimentemaceio.com.br/wp-content/uploads/2022/06/Mirante-Dr.-Hugo-Lima-Cruz-das-Almas-SEMTEL-TURISMO-Por-Maivan-Fernandez_16-scaled.jpg",
    "http://experimentemaceio.com.br/wp-content/uploads/2022/05/Foto-Davysson-Mendes-06-01-2022-Cadeira-de-Praia-Maceio-e-Massa-SEMTEL-3.jpg",
    "http://experimentemaceio.com.br/wp-content/uploads/2022/06/Museu-do-Comercio-e-Museu-da-Tecnologia-1.jpg"
  ],
);
