import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/commons/app_strings.dart';
import 'package:local_turism/views/pages/home_page.dart';

void main() {
  testWidgets('Find appBar widgets', (tester) async {
    await _createWidget(tester);

    expect(find.text(AppStrings.appBarText), findsOneWidget);

    expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
  });

  //! TODO: fazer os testes caso o retorno da api seja diferente de 200, retornar a tela de erro, se a conexão for waiting,mostrar widget de loadings

  testWidgets('', (tester) async {});
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: HomePageWidget(),
    ),
  );
}
