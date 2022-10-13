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
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No money spent yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  height: 270,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/zzz.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                //.addPattern("EEEE d MMMM yyyy")
                return ListTile(
                  leading: FittedBox(
                    child: CircleAvatar(
                      radius: 30,
                      child: Text(
                        '${transactions[index].amount}' 'DA',
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
