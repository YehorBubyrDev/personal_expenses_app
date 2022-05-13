import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Nothing here yet..',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black38,
                ),
              ),
              Icon(
                Icons.money_off,
                color: Colors.black38,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
