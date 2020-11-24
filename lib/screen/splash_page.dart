import 'dart:async';

import 'package:findwords/screen/HomePage.dart';
import 'package:findwords/utils/colors.dart';
import 'package:findwords/utils/size_helper.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  BuildContext context;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Timer _timer;

  startTime() async {
    _timer = Timer(new Duration(seconds: 2), navigationPage);
  }

  void navigationPage() {
    Navigator.of(_scaffoldKey.currentContext).pushReplacementNamed(HomePage.id);
    startTime();
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key: _scaffoldKey,
      appBar: null,
      body: Container(
        width: displayWidth(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[t3_colorPrimary, t3_colorPrimaryDark]),
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.loose,
                overflow: Overflow.visible,
                children: <Widget>[
                  Text(
                    'Find Words'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.white,
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    'Find Words'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      color: t3_colorPrimaryDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
