import './model/transaction.dart';
import './widget/transaction_widget.dart';
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
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.amber,
              elevation: 5,
              child: Text('CHART!'),
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
