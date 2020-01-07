import 'package:flutter/material.dart';

class NewTransactionInputWidget extends StatefulWidget {
  final Function _addNewTransactionFunction;

  NewTransactionInputWidget(this._addNewTransactionFunction);

  @override
  _NewTransactionInputWidgetState createState() => _NewTransactionInputWidgetState();
}

class _NewTransactionInputWidgetState extends State<NewTransactionInputWidget> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget._addNewTransactionFunction(enteredTitle, enteredAmount);
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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
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
