import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/core/commons/app_strings.dart';
import 'package:local_turism/views/widgets/drawer_widget.dart';

void main() {
  testWidgets('Find drawer widgets', (tester) async {
    await _createWidget(tester);

    final mainScreenTile = find.text(AppStrings.drawerMainScreenText);
    final referencesTile = find.text(AppStrings.drawerReferencesText);
    final aboutMeTile = find.text(AppStrings.drawerAboutMeText);

    expect(mainScreenTile, findsOneWidget);
    expect(referencesTile, findsOneWidget);
    expect(aboutMeTile, findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: DrawerWidget(),
    ),
  );
  await tester.pump();
}
