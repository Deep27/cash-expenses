import 'package:flutter/material.dart';

class NewTransactionInputWidget extends StatelessWidget {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  final Function _addNewTransactionFunction;

  NewTransactionInputWidget(this._addNewTransactionFunction);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
            ),
            FlatButton(
              child: Text('Add transaction'),
              textColor: Colors.purple,
              onPressed: () => _addNewTransactionFunction(_titleController.text, double.parse(_amountController.text)),
            )
          ],
        ),
      ),
    );
  }
}
