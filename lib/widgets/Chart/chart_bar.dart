import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(
    this.label,
    this.spendingAmount,
    this.spendingPctOfTotal, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: constraints.maxHeight * 0.12,
            child: FittedBox(
              child: Text('\₴${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          Container(
            height: constraints.maxHeight * 0.03,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.7,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: constraints.maxHeight * 0.03,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.12,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      );
    });
  }
}
