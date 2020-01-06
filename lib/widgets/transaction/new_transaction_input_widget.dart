import 'package:flutter/material.dart';

class NewTransactionInputWidget extends StatelessWidget {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  final Function _addNewTransactionFunction;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    _addNewTransactionFunction(enteredTitle, enteredAmount);
  }

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
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
            ),
            FlatButton(
              child: Text('Add transaction'),
              textColor: Colors.purple,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
