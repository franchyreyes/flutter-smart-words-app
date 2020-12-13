import 'package:findwords/components/button_component.dart';
import 'package:findwords/locale/locales.dart';
import 'package:findwords/screen/category_page.dart';
import 'package:findwords/screen/setting_page.dart';
import 'package:findwords/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  static String id = "HomePage_screen";

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[t3_colorPrimary, t3_colorPrimaryDark]),
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(7, 20, 7, 20),
                      child: ButtonComponent(
                          textContent: AppLocalizations.of(context).setting(),
                          onPressed: () {
                            Navigator.pushNamed(context, SettingPage.id);
                          },
                          color: t3_app_background.withOpacity(0.2)),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
                    child: ButtonComponent(
                        textContent: AppLocalizations.of(context).home(),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, CategoryPage.id);
                        },
                        color: t3_app_background.withOpacity(0.2)),
                  )),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: SizedBox(
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
