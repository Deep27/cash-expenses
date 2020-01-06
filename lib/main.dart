import 'package:flutter/material.dart'; 

import 'package:cash_expenses/trastaction/model/transaction.dart';
import 'package:cash_expenses/trastaction/widget/transaction_widget.dart';

void main() => runApp(CashExpensesApp());

class CashExpensesApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Old friends',
        amount: double.infinity,
        date: DateTime.now()),
    Transaction(
        id: 't3',
        title: 'New thoughts',
        amount: double.infinity,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            Column(
              children: <Widget>[
                ...transactions
                    .map((t) => TransactionWidget(t.amount, t.date, t.title))
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
