import 'package:flutter/material.dart';

import 'package:cash_expenses/home_page.dart';

void main() => runApp(CashExpensesApp());

class CashExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        fontFamily: 'BebasNeue'
      ),
      home: HomePage(),
    );
  }
}
