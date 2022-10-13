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
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  elevation: 6,
                  child: ListTile(
                    leading: FittedBox(
                      child: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: FittedBox(
                            child: Text(
                              '${transactions[index].amount}' + 'DA',
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      '${transactions[index].title}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(DateFormat("EEEE d MMMM yyyy")
                        .format(transactions[index].date!)),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
