import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:findwords/components/appbar_componet.dart';
import 'package:findwords/components/textfield_component.dart';
import 'package:findwords/locale/locales.dart';
import 'package:findwords/utils/colors.dart';
import 'package:findwords/utils/constant.dart';
import 'package:findwords/utils/size_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:random_color/random_color.dart';

class QuestionPage extends StatefulWidget {
  static String id = "QuestionPage_screen";

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      Audio("images/fw.mp3"),
    );
    assetsAudioPlayer.playlistFinished.listen((finished) {
      if (finished) {
         if(assetsAudioPlayer.isPlaying.value) {
           assetsAudioPlayer.open(
             Audio("images/fw.mp3"),
           );
         }
      }
    });
  }

  void dispose() {
    super.dispose();
    assetsAudioPlayer.dispose();
  }

  RandomColor _randomColor = RandomColor();
  List<Icon> iconList = [
    Icon(
      Icons.place,
      color: Colors.red,
      size: 60.0,
    ),
    Icon(
      Icons.audiotrack,
      color: Colors.green,
      size: 60.0,
    ),
    Icon(
      Icons.beach_access,
      color: Colors.blue,
      size: 60.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: t3_app_background,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).categoryTitle()),
        flexibleSpace: AppbarComponent(),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ClipPath(
              clipper: WaveClipperTwo(flip: true),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: t3_white, width: 1.0),
                    gradient: LinearGradient(
                        colors: <Color>[t3_colorPrimary, t3_colorPrimaryDark]),
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  ),
                  //color: _randomColor.randomColor(colorBrightness: ColorBrightness.light),
                  child: Center(
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: new BoxDecoration(
                        color: t3_app_background,
                        shape: BoxShape.circle,
                      ),
                      child: iconList[Random().nextInt(3)],
                    ),
                  )),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: displayWidth(context) * 0.80,
                      child: Text(
                          AppLocalizations.of(context).questionSubTitle(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: displayWidth(context) * 0.07,
                            color: t3_colorPrimaryDark,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/lightbulb.png'),
                          width: displayWidth(context) * 0.12,
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 8),
                          decoration: new BoxDecoration(
                            color: t3_gray,
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          width: displayWidth(context) * 0.80,
                          child: Text(
                            'P______',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: displayWidth(context) * 0.07,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 10.0,
                              color: t3_icon_color,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/pencil.png'),
                          width: displayWidth(context) * 0.12,
                        ),
                        TextFieldComponent(),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context).questionHelp(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: textSizeMedium,
                          color: t3_colorPrimary),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: displayWidth(context) * 0.85,
                      child: Text(
                        "Background sticky concurrent mark sweep GC freed 14206(707KB) AllocSpace objects, 20(400KB) LOS objects, 23% free, 6MB/8MB, paused 5.040ms total 18.230ms",
                        style: TextStyle(fontSize: 18, color: t3_icon_color),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: <Widget>[
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          AppLocalizations.of(context).questionIntent(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: textSizeLargeMedium,
                              color: t3_colorPrimary),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 60.0,
                            ),
                            Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 60.0,
                            ),
                            Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 60.0,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          /*Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 2,
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "You got 3 intent",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: textSizeLargeMedium,
                      color: t3_colorPrimary),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 60.0,
                    ),
                    Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 60.0,
                    ),
                    Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 60.0,
                    ),
                  ],
                )
              ],
            ),
          )*/
        ],
      ),
    );
  }
}
