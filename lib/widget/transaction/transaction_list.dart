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
      child: ListView.builder( 
        itemBuilder: (ctx, index) =>
            TransactionWidget.fromTransaction(_transactions[index]),
        itemCount: _transactions.length,
      ),
    );
  }
}
