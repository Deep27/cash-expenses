import 'package:flutter/material.dart';

import 'package:cash_expenses/widgets/chart_widget.dart';
import 'package:cash_expenses/widgets/transaction/new_transaction_input_widget.dart';
import 'package:cash_expenses/widgets/transaction/transaction_list_widget.dart';

void main() => runApp(CashExpensesApp());

class CashExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ChartWidget(),
            NewTransactionInputWidget(),
            TransactionListWidget(),
          ],
        ),
      ),
    );
  }
}
