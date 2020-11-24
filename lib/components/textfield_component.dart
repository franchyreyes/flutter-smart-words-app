



import 'package:findwords/utils/colors.dart';
import 'package:findwords/utils/constant.dart';
import 'package:findwords/utils/size_helper.dart';
import 'package:flutter/material.dart';

class TextFieldComponent extends StatefulWidget {
  @override
  TextFieldComponentState createState() => TextFieldComponentState();
}

class TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.80,
      padding: EdgeInsets.only(top: 20),
      decoration:
          boxDecoration(radius: 40, showShadow: true, bgColor: t3_white),
      child: TextFormField(

        maxLength: 1,
        style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
        decoration: InputDecoration(

          //contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          contentPadding: new EdgeInsets.symmetric(vertical: -15.0, horizontal: 10.0),
          hintText: "Write the letters here",
          filled: true,
          fillColor: t3_white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: t3_colorPrimaryDark, width: 1.0),
          ),
        ),
      ),
    );
  }
}
BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color bgColor, var showShadow = false}) {
  /*return BoxDecoration(
    color: Colors.white,
    boxShadow: [BoxShadow(color: Colors.grey),],
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );*/
}