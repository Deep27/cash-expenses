import 'package:flutter/material.dart';

import 'package:cash_expenses/widgets/transaction/new_transaction_input_widget.dart';
import 'package:cash_expenses/widgets/transaction/transaction_list_widget.dart';

class UserTransactionsWidget extends StatefulWidget {
  @override
  _UserTransactionsWidgetState createState() => _UserTransactionsWidgetState();
}

class _UserTransactionsWidgetState extends State<UserTransactionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransactionInputWidget(),
        TransactionListWidget(),
      ],
    );
  }
}
