import 'package:cash_expenses/widget/user_transactions.dart';
import 'package:flutter/material.dart';

import 'package:cash_expenses/widget/chart/chart.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter App')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ChartWidget(),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
