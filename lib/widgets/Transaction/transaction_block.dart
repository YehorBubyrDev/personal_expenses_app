import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class TransactionBlock extends StatefulWidget {
  final List<Transaction> userTransactions;
  final dynamic txID;
  final Function deleteTx;

  const TransactionBlock(
    this.userTransactions,
    this.txID,
    this.deleteTx, {
    Key? key,
  }) : super(key: key);

  @override
  State<TransactionBlock> createState() => _TransactionBlockState();
}

class _TransactionBlockState extends State<TransactionBlock> {
  var _bgColor;

  @override
  void initState() {
    // TODO: implement initState
    const availableColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.pink,
    ];

    _bgColor = availableColors[Random().nextInt(6)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Build TxBlock');
    final mediaQuery = MediaQuery.of(context);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\₴${widget.userTransactions[widget.txID].amount}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          widget.userTransactions[widget.txID].title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.userTransactions[widget.txID].date),
        ),
        trailing: mediaQuery.size.width > 460
            ? ElevatedButton.icon(
                icon: const Icon(Icons.delete_outline_outlined),
                label: const Text('Delete tx'),
                onPressed: () =>
                    widget.deleteTx(widget.userTransactions[widget.txID].id),
              )
            : IconButton(
                icon: const Icon(Icons.delete_outline_outlined),
                color: Theme.of(context).errorColor,
                onPressed: () =>
                    widget.deleteTx(widget.userTransactions[widget.txID].id),
              ),
      ),
    );
  }
}
