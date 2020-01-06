import 'package:cash_expenses/widgets/transaction/user_transactions_widget.dart';
import 'package:flutter/material.dart';

import 'package:cash_expenses/widgets/chart_widget.dart';

void main() => runApp(CashExpensesApp());

class CashExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ChartWidget(),
              UserTransactionsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
