import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction _transaction;
  final Function _removeTransactionFunction;

  const TransactionWidget(this._transaction, this._removeTransactionFunction);

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
          radius: 30,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: FittedBox(
                child: Text('\$${_transaction.amount}'),
              )),
        ),
        title: Text(
          _transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(_transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 560
            ? FlatButton.icon(
                label: const Text('Delete'),
                icon: const Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                onPressed: () => _removeTransactionFunction(_transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => _removeTransactionFunction(_transaction.id),
              ),
      ),
    );
  }
}
