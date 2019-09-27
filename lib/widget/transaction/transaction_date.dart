import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionDate extends StatelessWidget {
  final DateTime _date;

  TransactionDate(this._date);

  @override
  Widget build(BuildContext context) {
    return Text(
      _date.toString(),
      style: TextStyle(
        color: Colors.grey,
      ),
    );
  }
}
