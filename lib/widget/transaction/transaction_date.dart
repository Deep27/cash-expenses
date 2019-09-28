import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionDate extends StatelessWidget {
  final String _date;

  TransactionDate(DateTime date)
      : _date = DateFormat('dd-MM-yyyy HH:mm').format(date);

  @override
  Widget build(BuildContext context) {
    return Text(
      _date,
      style: TextStyle(
        color: Colors.red,
      ),
    );
  }
}
