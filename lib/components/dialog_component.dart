import 'package:findwords/locale/locales.dart';
import 'package:findwords/utils/colors.dart';
import 'package:findwords/utils/constant.dart';
import 'package:flutter/material.dart';


class DialogComponent extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback onPressed2;
  final Color color;
  final String title;
  final String description;
  final String textButton;
  final bool duration;
  DialogComponent({this.onPressed,this.onPressed2,this.color,this.title,this.description,this.textButton,this.duration});

  @override
  Widget build(BuildContext context) {
    if(duration){
      return Dialog(
        insetAnimationDuration: const Duration(milliseconds: 2000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context,this.onPressed,this.onPressed2,this.color,this.title,this.description,this.textButton),
      );
    }
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context,this.onPressed,this.onPressed2,this.color,this.title,this.description,this.textButton),
    );

  }
}

dialogContent(BuildContext context, VoidCallback onPressed,VoidCallback onPressed2,Color colorParam , String title, String description,String textButton) {
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
            onTap: onPressed2,
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: Icon(Icons.close, color: t3_icon_color),
            ),
          ),
          text(title, textColor: colorParam, fontFamily: fontBold, fontSize: textSizeLarge),
          SizedBox(height: 24),
          Image.asset("images/face_dialog.png", color: colorParam, width: 95, height: 95),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: text(description, textColor:t3_colorPrimary, fontSize: textSizeMedium, maxLine: 2, isCentered: true),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration: BoxDecoration(
                color: t3_colorPrimary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: text(textButton, textColor: t3_white, fontFamily: fontMedium, fontSize: textSizeNormal),
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
