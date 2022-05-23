import 'package:flutter/material.dart';
// MY FILES ---------------------
import './transaction_block.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import './empty_list.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;

  const TransactionList(this.userTransactions, this.deleteTx, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Build TxList');
    return userTransactions.isEmpty
        ? const Empty()
        : Container(
            color: Colors.black12,
            child: ListView(
              children: [
                ...userTransactions.asMap().entries.map((tx) {
                  int idx = tx.key;
                  return TransactionBlock(
                    userTransactions,
                    idx,
                    deleteTx,
                    key: ValueKey(tx.value.id),
                  );
                })
              ],
            ),
          );
  }
}
