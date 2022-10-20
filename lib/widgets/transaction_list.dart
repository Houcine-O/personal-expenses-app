import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  Function delTransaction;
  final bool isLandscape;
  TransactionList(this.transactions, this.delTransaction, this.isLandscape);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: ((context, constraints) {
              return Column(
                children: [
                  Text(
                    'No money spent yet!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.8,
                    width: isLandscape
                        ? constraints.maxWidth * 0.4
                        : constraints.maxWidth,
                    child: Image.asset(
                      'assets/images/zzz.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            }),
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
                  subtitle: Text(
                      DateFormat("yMEd").format(transactions[index].date!)),
                  trailing: MediaQuery.of(context).size.width < 460
                      ? CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          radius: 30,
                          child: IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.delete),
                            onPressed: () =>
                                delTransaction(transactions[index].id),
                          ),
                        )
                      : FlatButton.icon(
                          textColor: Colors.redAccent,
                          onPressed: () =>
                              delTransaction(transactions[index].id),
                          icon: Icon(Icons.delete),
                          label: Text("Delete"),
                        ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
