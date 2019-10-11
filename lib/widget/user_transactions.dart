import 'package:cash_expenses/model/transaction.dart';
import 'package:cash_expenses/widget/add_transaction.dart';
import 'package:cash_expenses/widget/transaction/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction('t1', 'Good friends', 0, DateTime.now()),
    Transaction('t2', 'A better life', 0, DateTime.now()),
    Transaction('t3', 'Happy people', 0, DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final Transaction newTransaction =
        Transaction(DateTime.now().toString(), title, amount, DateTime.now());
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTransaction(_addNewTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
