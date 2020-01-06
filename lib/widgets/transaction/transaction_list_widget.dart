import 'package:flutter/material.dart';

import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:cash_expenses/widgets/transaction/transaction_widget.dart';

class TransactionListWidget extends StatelessWidget {

  final List<Transaction> _transactions;

  TransactionListWidget(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ..._transactions
            .map((t) => TransactionWidget(t.title, t.amount, t.date))
            .toList(),
      ],
    );
  }
}
