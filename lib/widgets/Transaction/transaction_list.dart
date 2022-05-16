import 'package:flutter/material.dart';
// MY FILES ---------------------
import './transaction_block.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import './empty_list.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  const TransactionList(this.userTransactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? const Empty()
        : Container(
            height: 500,
            color: Colors.black12,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionBlock(userTransactions, index);
              },
              itemCount: userTransactions.length,
            ),
          );
  }
}