import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// MY FILES ---------------------
import 'package:personal_expenses_app/models/transaction.dart';
import './chart_bar.dart';

class ExpensesChart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const ExpensesChart(this.recentTransaction, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0.0;

        for (var i = 0; i < recentTransaction.length; i++) {
          if (recentTransaction[i].date.day == weekDay.day &&
              recentTransaction[i].date.month == weekDay.month &&
              recentTransaction[i].date.year == weekDay.year) {
            totalSum += recentTransaction[i].amount;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay),
          'amount': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get totalSpending => groupedTransactionValue.fold(0.0, (sum, item) {
        var amount = item['amount'] as double;
        return sum + amount;
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValue.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                '${data['day']}',
                data['amount'] as double,
                totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
