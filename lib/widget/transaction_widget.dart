import '../model/transaction.dart';
import 'package:flutter/material.dart';

class TrannsactionWidget extends StatelessWidget {
  Transaction _transaction;

  TrannsactionWidget(
      {@required String id,
      @required String title,
      @required DateTime date,
      @required double amount}) {
        _transaction = Transaction(id: id, title: title, date: date, amount: amount);
      }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
