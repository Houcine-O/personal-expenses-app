import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';
import '../models/transactions.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTranx;

  Chart(this.recentTranx);

  List<Map<String, Object>> get groupedTranx {
    return List.generate(7, (index) {
      var weekDay = DateTime.now().subtract(Duration(
        days: index,
      ));
      double sum = 0.00;
      for (var i = 0; i < recentTranx.length; i++) {
        if (weekDay.day == recentTranx[i].date?.day &&
            weekDay.month == recentTranx[i].date?.month &&
            weekDay.year == recentTranx[i].date?.year) {
          sum += recentTranx[i].amount!;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': sum
      };
    });
  }

  double get totalSpending {
    return groupedTranx.fold(0.0, (sum, element) {
      return sum + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTranx.map((elt) {
            return Flexible(
              fit: FlexFit.tight,
              child: Bar(
                elt['day'] as String,
                elt['amount'] as double,
                totalSpending == 0
                    ? 0
                    : (elt['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
