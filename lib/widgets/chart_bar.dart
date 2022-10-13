import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final int amountSpent;
  final double spentPercntg;
  final String label;

  Bar(this.label, this.amountSpent, this.spentPercntg);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('${amountSpent}DA')),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spentPercntg,
              child: Container(
                  decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              )),
            )
          ]),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
