import '../model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction _transaction;

  TransactionWidget(
      {@required String id,
      @required String title,
      @required DateTime date,
      @required double amount})
      : _transaction = Transaction(id, title, amount, date);

  TransactionWidget.fromTransaction(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      elevation: 5,
      child: Row(
        children: <Widget>[ 
          Container(
            child: Text(
              _transaction.amount.toStringAsFixed(2),
            ),
          ),
          Column(
            children: <Widget>[
              Text(_transaction.title),
              Text(_transaction.date.toString()),
            ],
          )
        ],
      ),
    );
  }
}
