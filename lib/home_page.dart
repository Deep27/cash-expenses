import 'package:cash_expenses/widget/chart/chart.dart';
import 'package:cash_expenses/widget/transaction/transaction_widget.dart';

import './model/transaction.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Transaction> _transactions = [
    Transaction('t1', 'Good friends', 0, DateTime.now()),
    Transaction('t2', 'A better life', 0, DateTime.now()),
    Transaction('t3', 'Happy people', 0, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter App')),
      body: Column(
        children: <Widget>[
          ChartWidget(),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                  ),
                  FlatButton(
                    child: Text('Add transaction'),
                    textColor: Colors.brown,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: _transactions
                  .map((tx) => TransactionWidget.fromTransaction(tx))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
