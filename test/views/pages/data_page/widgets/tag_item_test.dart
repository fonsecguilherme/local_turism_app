import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/core/features/home_page/widgets/tag_item.dart';

void main() {
  testWidgets('Find tags according to a list', (tester) async {
    await _createWidget(tester);

    final tags = find.byType(ListView);
    expect(tags, findsOneWidget);

    expect(find.text(_tagsList.first), findsOneWidget);
    expect(find.text(_tagsList.elementAt(1)), findsOneWidget);
    expect(find.text(_tagsList.elementAt(2)), findsOneWidget);
    expect(find.text(_tagsList.last), findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: TagItemWidget(tagsList: _tagsList),
    ),
  );
  await tester.pump();
}

final List<String> _tagsList = [
  'tag um',
  'tag dois',
  'tag três',
  'tag quatro',
];
