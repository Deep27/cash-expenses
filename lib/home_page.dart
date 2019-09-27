import './model/transaction.dart';
import 'package:flutter/material.dart'; 

class HomePage extends StatelessWidget {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'Good friends', date: DateTime.now(), amount: 0),
    Transaction(
        id: 't2', title: 'A better life', date: DateTime.now(), amount: 0),
    Transaction(
        id: 't2', title: 'Happy people', date: DateTime.now(), amount: 0),
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
                  .map((tx) => Card(
                        color: Colors.amber,
                        elevation: 5,
                        child: Text(tx.title),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
