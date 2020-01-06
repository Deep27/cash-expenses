import 'package:flutter/material.dart';

import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:cash_expenses/widgets/transaction/transaction_widget.dart';

class TransactionListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TransactionListWidgetState();
}

class _TransactionListWidgetState extends State<TransactionListWidget> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
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
    return Column(
      children: <Widget>[
        ..._transactions
            .map((t) => TransactionWidget(t.title, t.amount, t.date))
            .toList(),
      ],
    );
  }
}
