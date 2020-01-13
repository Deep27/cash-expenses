import 'package:flutter/material.dart';

import 'package:cash_expenses/home_page.dart';

void main() => runApp(CashExpensesApp());

const String _FONT_FAMILY = 'BebasNeue';

class CashExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        fontFamily: _FONT_FAMILY,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: _FONT_FAMILY,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(color: Colors.white),
            ),
      ),
      home: HomePage(),
    );
  }
}
