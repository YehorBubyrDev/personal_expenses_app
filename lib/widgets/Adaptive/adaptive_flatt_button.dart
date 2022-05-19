import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String title;
  final Function submitData;
  const AdaptiveFlatButton({
    required this.submitData,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isIOS
          ? CupertinoButton.filled(
              onPressed: () => submitData,
              child: Text(title),
            )
          : ElevatedButton(
              onPressed: () => submitData,
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 14),
              ),
              child: Text(title),
            ),
    );
  }
}
