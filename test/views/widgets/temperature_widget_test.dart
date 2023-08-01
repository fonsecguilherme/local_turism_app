import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/views/widgets/temperature_widget.dart';

void main() {
  testWidgets('temperature widget ...', (tester) async {
    // TODO: Implement test
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: TemperatureWidget(woeid: 12345),
    ),
  );
  await tester.pump();
}
