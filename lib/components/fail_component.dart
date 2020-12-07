import 'package:flutter/material.dart';

class FailComponent extends StatelessWidget {
  final int intent;

  FailComponent({this.intent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < intent; i++)
            Icon(
              Icons.error,
              color: Colors.red,
              size: 60.0,
            )
        ],
      ),
    );
  }
}
