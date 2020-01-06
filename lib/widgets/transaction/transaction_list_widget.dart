import 'package:flutter/material.dart';

import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:cash_expenses/widgets/transaction/transaction_widget.dart';

class TransactionListWidget extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionListWidget(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) => TransactionWidget(
          _transactions[index].title,
          _transactions[index].amount,
          _transactions[index].date,
        ),
        itemCount: _transactions.length,
      ),
    );
  }
}
