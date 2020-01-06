import 'package:flutter/material.dart';

import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:cash_expenses/widgets/transaction/new_transaction_input_widget.dart';
import 'package:cash_expenses/widgets/transaction/transaction_list_widget.dart';

class UserTransactionsWidget extends StatefulWidget {
  @override
  _UserTransactionsWidgetState createState() => _UserTransactionsWidgetState();
}

class _UserTransactionsWidgetState extends State<UserTransactionsWidget> {

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
        NewTransactionInputWidget(),
        TransactionListWidget(_transactions),
      ],
    );
  }
}
