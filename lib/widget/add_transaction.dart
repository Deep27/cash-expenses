import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function _addTransactionHandler;

  AddTransaction(this._addTransactionHandler);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void _addTransaction() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);
    if (title.isNotEmpty && amount >= 0) {
      widget._addTransactionHandler(title, amount);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _addTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _addTransaction(),
            ),
            FlatButton(
              child: Text('Add transaction'),
              textColor: Colors.brown,
              onPressed: _addTransaction,
            ),
          ],
        ),
      ),
    );
  }
}
