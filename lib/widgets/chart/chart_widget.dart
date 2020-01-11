import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction> _recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues =>
      List.generate(7, (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        double totalSum = 0.0;
        for (var i = 0; i < _recentTransactions.length; i++) {
          if (_recentTransactions[i].date.day == weekDay.day &&
              _recentTransactions[i].date.month == weekDay.month &&
              _recentTransactions[i].date.year == weekDay.year) {
                totalSum += _recentTransactions[i].amount;
              }
        }
        print(DateFormat.E().format(weekDay));
        print(totalSum);
        return {
          'day': DateFormat.E().format(weekDay),
          'amount': totalSum,
        };
      });

  ChartWidget(this._recentTransactions);

  @override
  Widget build(BuildContext context) {
    groupedTransactionValues;
    return Container(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Row(
          children: <Widget>[],
        ),
        margin: EdgeInsets.all(20),
        elevation: 5,
      ),
    );
  }
}
