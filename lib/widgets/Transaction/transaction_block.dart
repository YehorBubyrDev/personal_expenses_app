import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class TransactionBlock extends StatelessWidget {
  final List<Transaction> userTransactions;
  final int txID;
  final Function deleteTx;

  const TransactionBlock(
    this.userTransactions,
    this.txID,
    this.deleteTx, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\₴${userTransactions[txID].amount}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          userTransactions[txID].title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(userTransactions[txID].date),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline_outlined),
          color: Theme.of(context).errorColor,
          onPressed: () => deleteTx(userTransactions[txID].id),
        ),
      ),
    );
  }
}
