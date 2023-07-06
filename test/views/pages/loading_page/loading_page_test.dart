import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/views/pages/loading_page/loading_page.dart';

void main() {
  testWidgets('Must find CircularProgressIndicator', (tester) async {
    await _createWidget(tester);

    final loadingWidget = find.byType(CircularProgressIndicator);

    expect(loadingWidget, findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: LoadingPage(),
    ),
  );
}
