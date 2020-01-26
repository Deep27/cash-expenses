import 'package:flutter/material.dart';

import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:cash_expenses/widgets/transaction/transaction_widget.dart';

class TransactionListWidget extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _removeTransaction;

  TransactionListWidget(this._transactions, this._removeTransaction);

  @override
  Widget build(BuildContext context) => Container(
      child: _transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) => Column(
                children: <Widget>[
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/terminator.jpeg',
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 10),
                  const Text('No transactions added yet.'),
                ],
              ),
            )
          : ListView(
              children: _transactions
                  .map((tx) => TransactionWidget(
                      ValueKey(tx.id), tx, _removeTransaction))
                  .toList(),
            ));
}
