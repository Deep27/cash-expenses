import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cash_expenses/main.dart';

void main() {
  testWidgets('HomePage test', (WidgetTester tester) async {
    await tester.pumpWidget(CashExpensesApp());
    expect(find.text('CHART!'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('Abubububububu'), findsNothing);
  });
}
