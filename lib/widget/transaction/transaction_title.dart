import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionTitle extends StatelessWidget {
  final String _title;

  TransactionTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.brown,
      ),
    );
  }
}
