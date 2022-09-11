import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import './models/transactions.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 5000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Headset', amount: 3500, date: DateTime.now())
  ];

  void _addTransaction(String title, double amount) {
    final newtx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newtx);
    });
  }

  void _startAddTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return GestureDetector(
          child: NewTransaction(_addTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses App"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                color: Colors.lightBlue,
                elevation: 5,
                child: Text("Chart"),
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () => _startAddTransaction(context),
      ),
    );
  }
}
