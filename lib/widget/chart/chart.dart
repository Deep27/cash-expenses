import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).primaryColor,
        elevation: 10,
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'CHART!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ),
      ),
    );
  }
}
