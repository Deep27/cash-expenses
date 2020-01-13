import 'package:flutter/material.dart';

import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:cash_expenses/widgets/transaction/transaction_widget.dart';

class TransactionListWidget extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _removeTransaction;

  TransactionListWidget(this._transactions, this._removeTransaction); 

  @override
  Widget build(BuildContext context) => Container(
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
                itemBuilder: (ctx, i) => TransactionWidget(
                  _transactions[i].title,
                  _transactions[i].amount,
                  _transactions[i].date,
                  _transactions[i].id,
                  _removeTransaction,
                ),
                itemCount: _transactions.length,
              ),
      );
}
