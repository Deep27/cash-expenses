import 'package:flutter/material.dart';

import 'package:cash_expenses/home_page.dart';

void main() => runApp(CashExpensesApp());

class CashExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Personal Expenses',
      home: HomePage(),
    );
  }
}
