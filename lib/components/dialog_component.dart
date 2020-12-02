import 'package:findwords/locale/locales.dart';
import 'package:findwords/utils/colors.dart';
import 'package:findwords/utils/constant.dart';
import 'package:flutter/material.dart';


class DialogComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  return Container(
      decoration: BoxDecoration(
        color: t3_app_background,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: Icon(Icons.close, color: t3_icon_color),
            ),
          ),
          text(AppLocalizations.of(context).questionDialogTitle(), textColor: Colors.green, fontFamily: fontBold, fontSize: textSizeLarge),
          SizedBox(height: 24),
          Image.asset("images/face_dialog.png", color: Colors.green, width: 95, height: 95),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: text(AppLocalizations.of(context).questionDialogText(), textColor:t3_colorPrimary, fontSize: textSizeMedium, maxLine: 2, isCentered: true),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration: BoxDecoration(
                color: t3_colorPrimary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: text(AppLocalizations.of(context).questionDialogButton(), textColor: t3_white, fontFamily: fontMedium, fontSize: textSizeNormal),
            ),
          )
        ],
      ));
}

Widget text(
    String text, {
      var fontSize = textSizeLargeMedium,
      textColor = Colors.red,
      var fontFamily,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.5,
      bool textAllCaps = false,
      var isLongText = false,
      bool lineThrough = false,
    }) {
  return Text(
    textAllCaps ? text.toUpperCase() : text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: isLongText ? null : maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily ?? null,
      fontSize: fontSize,
      color: textColor,
      height: 1.5,
      letterSpacing: latterSpacing,
      decoration:
      lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
    ),
  );
}
