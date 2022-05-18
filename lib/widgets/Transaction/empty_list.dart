import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FittedBox(
                child: Text(
                  'No transaction added yet...',
                  style: TextStyle(
                    fontSize: 20 * curScaleFactor,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
