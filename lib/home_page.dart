import 'package:flutter/material.dart';

import 'package:cash_expenses/widgets/chart_widget.dart';
import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:cash_expenses/widgets/transaction/transaction_list_widget.dart';
import 'package:cash_expenses/widgets/transaction/new_transaction_input_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    Transaction(
        id: 't3',
        title: 'New thoughts',
        amount: double.infinity,
        date: DateTime.now()),
    Transaction(
        id: 't3',
        title: 'New thoughts',
        amount: double.infinity,
        date: DateTime.now()),
    Transaction(
        id: 't3',
        title: 'New thoughts',
        amount: double.infinity,
        date: DateTime.now()),
    Transaction(
        id: 't3',
        title: 'New thoughts',
        amount: double.infinity,
        date: DateTime.now()),
    Transaction(
        id: 't3',
        title: 'New thoughts',
        amount: double.infinity,
        date: DateTime.now()),
    Transaction(
        id: 't3',
        title: 'New thoughts',
        amount: double.infinity,
        date: DateTime.now()),
    Transaction(
        id: 't3',
        title: 'New thoughts',
        amount: double.infinity,
        date: DateTime.now()),
    Transaction(
        id: 't3',
        title: 'New thoughts',
        amount: double.infinity,
        date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    setState(() {
      _transactions.add(Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
      ));
    });
  }

  void _showAddTransactionBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) => NewTransactionInputWidget(_addNewTransaction),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddTransactionBottomSheet(context),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddTransactionBottomSheet(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ChartWidget(),
            TransactionListWidget(_transactions),
          ],
        ),
      ),
    );
  }
}
