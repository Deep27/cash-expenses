import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(CashExpensesApp());

class CashExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cash Expenses',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: HomePage()
    );
  }
} 
