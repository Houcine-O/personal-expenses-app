import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTranx;

  Chart(this.recentTranx);

  List<Map<String, Object>> get groupedTranx {
    return List.generate(7, (index) {
      var weekDay = DateTime.now().subtract(Duration(
        days: index,
      ));
      var sum;
      for (var i = 0; i < recentTranx.length; i++) {
        if (weekDay.day == recentTranx[i].date?.day &&
            weekDay.month == recentTranx[i].date?.month &&
            weekDay.year == recentTranx[i].date?.year) {
          sum += recentTranx[i].amount;
        }
      }

      print(DateFormat.E(weekDay));
      print(sum);
      return {'day': DateFormat.E(weekDay), 'amount': sum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(children: []),
    );
  }
}
