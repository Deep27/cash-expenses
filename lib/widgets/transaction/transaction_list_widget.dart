import 'package:flutter/material.dart';

import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:cash_expenses/widgets/transaction/transaction_widget.dart';

class TransactionListWidget extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionListWidget(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: _transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  height: 200,
                  child: Image.asset('assets/images/terminator.jpeg',
                      fit: BoxFit.cover),
                ),
                SizedBox(height: 10),
                Text('No transactions added yet.'),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) => TransactionWidget(
                _transactions[index].title,
                _transactions[index].amount,
                _transactions[index].date,
              ),
              itemCount: _transactions.length,
            ),
    );
  }
}
