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
    // Transaction(
    //   id: 't1',
    //   title: 'New shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //     id: 't2',
    //     title: 'Old friends',
    //     amount: 999999999.99,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't3',
    //     title: 'New thoughts',
    //     amount: 100.05,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't4',
    //     title: 'New thoughts',
    //     amount: 100.10,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't5',
    //     title: 'New thoughts',
    //     amount: 130.39,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't6',
    //     title: 'New thoughts',
    //     amount: 15.0,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't7',
    //     title: 'New thoughts',
    //     amount: 10.0,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't8',
    //     title: 'New thoughts',
    //     amount: 11.11,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't9',
    //     title: 'New thoughts',
    //     amount: 12.0,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't10',
    //     title: 'New thoughts',
    //     amount: 11.12,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't11',
    //     title: 'New thoughts',
    //     amount: 100.0,
    //     date: DateTime.now()),
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
                  0.4,
              child: ChartWidget(_recentTransactions),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      _appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.6,
              child: TransactionListWidget(
                  _recentTransactions, _removeTransaction),
            ),
          ],
        ),
      ),
    );
  }
}
