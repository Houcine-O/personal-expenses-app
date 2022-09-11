import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.purple,
                    ),
                  ),
                  child: Text(
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    '${transactions[index].amount?.toStringAsFixed(0)} DA',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title as String,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      //MMMMdEEEE
                      DateFormat()
                          .addPattern("EEEE d MMMM yyyy")
                          .format(transactions[index].date as DateTime),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
