import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_turism/views/widgets/tag_item.dart';

void main() {
  testWidgets('Find tags according to a list', (tester) async {
    await _createWidget(tester);

    final tags = find.byType(ListView);
    expect(tags, findsOneWidget);

    expect(find.text('tag um'), findsOneWidget);
    expect(find.text('tag dois'), findsOneWidget);
    expect(find.text('tag três'), findsOneWidget);
    expect(find.text('tag quatro'), findsOneWidget);
  });

  //! Create swipe widget test
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
