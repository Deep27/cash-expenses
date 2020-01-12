import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:cash_expenses/widgets/chart/chart_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _DAY = 'day';
const _AMOUNT = 'amount';

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
        return {
          _DAY: DateFormat.E().format(weekDay).substring(0, 1),
          _AMOUNT: totalSum,
        };
      });

  ChartWidget(this._recentTransactions);

  double get totalSpending =>
      groupedTransactionValues.fold(0.0, (sum, item) => sum + item[_AMOUNT]);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues
                .map((tx) => Flexible(
                      fit: FlexFit.tight,
                      child: ChartBarWidget(
                        tx[_DAY],
                        tx[_AMOUNT],
                        totalSpending == 0.0
                            ? 0.0
                            : (tx[_AMOUNT] as double) / totalSpending,
                      ),
                    ))
                .toList(),
          ),
        ),
        margin: EdgeInsets.all(20),
        elevation: 6,
      ),
    );
  }
}
