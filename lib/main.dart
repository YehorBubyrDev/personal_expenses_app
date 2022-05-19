import 'package:flutter/material.dart';
// MY FILES ---------------------
import './models/transaction.dart';
import './widgets/Transaction/transaction_list.dart';
import './widgets/Transaction/new_transaction.dart';
import './widgets/Chart/chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peronal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Quicks',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: DateTime.now().toString(),
      title: 'Water',
      amount: 20.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'Water',
      amount: 20.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'Water',
      amount: 20.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'Water',
      amount: 20.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'Water',
      amount: 20.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'Water',
      amount: 20.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'Water',
      amount: 20.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'Water',
      amount: 20.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'Water',
      amount: 20.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'Water',
      amount: 20.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'Water',
      amount: 20.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'Water',
      amount: 20.90,
      date: DateTime.now(),
    ),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransaction {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: txDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTx(String txID) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == txID);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscapeMode =
        mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
      title: const Text('Personal Expenses'),
      backgroundColor: Colors.lightGreen,
      actions: <Widget>[
        IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ))
      ],
    );
    final txListWidget = SizedBox(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(_userTransactions, _deleteTx),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscapeMode)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Show chart'),
                  Switch(
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandscapeMode)
              SizedBox(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.3,
                child: ExpensesChart(_recentTransaction),
              ),
            if (!isLandscapeMode) txListWidget,
            if (isLandscapeMode)
              _showChart
                  ? SizedBox(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.7,
                      child: ExpensesChart(_recentTransaction),
                    )
                  : txListWidget,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
