import 'package:cash_expenses/widgets/transaction/transaction_list_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(CashExpensesApp());

class CashExpensesApp extends StatelessWidget {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: _amountController,
                    ),
                    FlatButton(
                      child: Text('Add transaction'),
                      textColor: Colors.purple,
                      onPressed: () => print(
                          '${_titleController.text} & ${_amountController.text}'),
                    ),
                  ],
                ),
              ),
            ),
            TransactionListWidget(),
          ],
        ),
      ),
    );
  }
}
