import 'dart:math';

import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

const List<MaterialColor> _availableColors = const [
  Colors.green,
  Colors.orange
];

class TransactionWidget extends StatefulWidget {
  final Transaction _transaction;
  final Function _removeTransactionFunction;

  const TransactionWidget(
      Key key, this._transaction, this._removeTransactionFunction)
      : super(key: key);

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  MaterialColor _bgColor;

  @override
  void initState() {
    _bgColor = _availableColors[Random().nextInt(_availableColors.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 3,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: FittedBox(
                child: Text('\$${widget._transaction.amount}'),
              )),
        ),
        title: Text(
          widget._transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget._transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 560
            ? FlatButton.icon(
                label: const Text('Delete'),
                icon: const Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                onPressed: () =>
                    widget._removeTransactionFunction(widget._transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () =>
                    widget._removeTransactionFunction(widget._transaction.id),
              ),
      ),
    );
  }
}
