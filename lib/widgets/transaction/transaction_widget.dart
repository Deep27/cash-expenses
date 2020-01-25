import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {
  final String _title;
  final double _amount;
  final DateTime _date;
  final String _id;
  final Function _removeTransactionFunction;

  TransactionWidget(this._title, this._amount, this._date, this._id,
      this._removeTransactionFunction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 3,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: FittedBox(
                child: Text('\$$_amount'),
              )),
        ),
        title: Text(
          _title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(_date),
        ),
        trailing: MediaQuery.of(context).size.width > 560
            ? FlatButton.icon(
                label: Text('Delete'),
                icon: Icon(
                  Icons.delete,
                ),
                textColor: Theme.of(context).errorColor,
                onPressed: () => _removeTransactionFunction(_id),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => _removeTransactionFunction(_id),
              ),
      ),
    );
  }
}
