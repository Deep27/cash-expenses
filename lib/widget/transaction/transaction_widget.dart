import 'package:cash_expenses/model/transaction.dart';
import 'package:cash_expenses/widget/transaction/transaction_amount.dart';
import 'package:cash_expenses/widget/transaction/transaction_date.dart';
import 'package:cash_expenses/widget/transaction/transaction_title.dart';
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
      child: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            TransactionAmount(_transaction.amount),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TransactionTitle(_transaction.title),
                TransactionDate(_transaction.date),
              ],
            )
          ],
        ),
      ),
    );
  }
}
