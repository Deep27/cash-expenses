import 'package:cash_expenses/model/transaction.dart';
import 'package:cash_expenses/widget/add_transaction.dart';
import 'package:cash_expenses/widget/transaction/transaction_list.dart';
import 'package:flutter/material.dart';

import 'package:cash_expenses/widget/chart/chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
//    Transaction('t1', 'Nothing', 0, DateTime.now()),
//    Transaction('t2', 'Nothing 2', 0, DateTime.now()),
//    Transaction('t3', 'Nothing 3', 0, DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final Transaction newTransaction =
        Transaction(DateTime.now().toString(), title, amount, DateTime.now());
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _showAddTransactionWidget(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) => AddTransaction(_addNewTransaction));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddTransactionWidget(context),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          ChartWidget(),
          TransactionList(_transactions),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddTransactionWidget(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
