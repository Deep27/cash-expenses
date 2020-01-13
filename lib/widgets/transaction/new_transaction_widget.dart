import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionWidget extends StatefulWidget {
  final Function _addNewTransactionFunction;

  NewTransactionWidget(this._addNewTransactionFunction);

  @override
  _NewTransactionWidgetState createState() => _NewTransactionWidgetState();
}

class _NewTransactionWidgetState extends State<NewTransactionWidget> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget._addNewTransactionFunction(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _percentDatePicker() => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime.now(),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
      });

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
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No date chosen!'
                        : 'Transaction date: ${DateFormat('yyyy.MM.dd').format(_selectedDate)}'),
                  ),
                  FlatButton(
                    child: Text(
                      _selectedDate == null ? 'Chose date' : 'Change date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _percentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
