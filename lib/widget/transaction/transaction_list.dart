import 'package:cash_expenses/model/transaction.dart';
import 'package:flutter/material.dart';

import './transaction_widget.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      child: _transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: Image.asset('assets/images/orange.png',
                      fit: BoxFit.cover),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) =>
                  TransactionWidget.fromTransaction(_transactions[index]),
              itemCount: _transactions.length,
            ),
    );
  }
}
