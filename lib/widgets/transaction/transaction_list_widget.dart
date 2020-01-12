import 'package:flutter/material.dart';

import 'package:cash_expenses/models/transaction/transaction.dart';
import 'package:cash_expenses/widgets/transaction/transaction_widget.dart';
import 'package:intl/intl.dart';

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
              itemBuilder: (ctx, i) => Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 3,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                          child: Text('\$${_transactions[i].amount}'),
                        )),
                  ),
                  title: Text(
                    _transactions[i].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(_transactions[i].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: null,
                  ),
                ),
              ),
              // itemBuilder: (ctx, index) => TransactionWidget(
              //   _transactions[index].title,
              //   _transactions[index].amount,
              //   _transactions[index].date,
              // ),
              itemCount: _transactions.length,
            ),
    );
  }
}
