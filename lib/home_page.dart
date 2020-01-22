import 'package:flutter/material.dart';

import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:cash_expenses/widgets/chart/chart_widget.dart';
import 'package:cash_expenses/widgets/transaction/transaction_list_widget.dart';
import 'package:cash_expenses/widgets/transaction/new_transaction_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Shoes',
      amount: 69.99,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    Transaction(
      id: 't2',
      title: 'Desk',
      amount: 20.15,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
        id: 't3',
        title: 'Chair',
        amount: 73.05,
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: 't4',
        title: 'Medicine',
        amount: 100.10,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: 't5',
        title: 'Game',
        amount: 10.00,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: 't6',
        title: 'Carpet',
        amount: 15.0,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: 't7', title: 'Tea', amount: 3.5, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions => _transactions
      .where(
          (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
      .toList();

  void _addNewTransaction(String title, double amount, DateTime date) {
    setState(() {
      _transactions.add(Transaction(
        title: title,
        amount: amount,
        date: date,
        id: DateTime.now().toString(),
      ));
    });
  }

  void _removeTransaction(String id) {
    setState(() => _transactions.removeWhere((tx) => tx.id == id));
  }

  void _showAddTransactionBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) => NewTransactionWidget(_addNewTransaction),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      title: Text(
        'Personal Expenses',
        style: TextStyle(
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _showAddTransactionBottomSheet(context),
        )
      ],
    );
    return Scaffold(
      appBar: _appBar,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddTransactionBottomSheet(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      _appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.22,
              child: ChartWidget(_recentTransactions),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      _appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.78,
              child: TransactionListWidget(
                  _recentTransactions, _removeTransaction),
            ),
          ],
        ),
      ),
    );
  }
}
