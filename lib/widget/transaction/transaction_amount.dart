import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionAmount extends StatelessWidget {
  final double _amount;

  TransactionAmount(this._amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.brown,
          width: 2,
        ),
      ),
      child: Text(
        '\$' + _amount.toStringAsFixed(2),
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.brown),
      ),
    );
  }
}
