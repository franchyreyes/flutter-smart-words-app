import 'package:findwords/model/category.dart';
import 'package:findwords/screen/question_page.dart';
import 'package:findwords/utils/colors.dart';
import 'package:findwords/utils/constant.dart';
import 'package:findwords/utils/size_helper.dart';
import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  final Category model;

  CategoryComponent(this.model);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, QuestionPage.id, arguments:{
              "model": model
            });
          },
          child: Container(
            width: displaySize(context).width,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: boxDecoration(
                      bgColor: t3_white, radius: 12, showShadow: true),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Image(
                      image: AssetImage('images/${model.img}'),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: text(model.name, textColor: t3_colorPrimary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class T9CategoryModel {
  String img;
  String name;

  T9CategoryModel({this.img, this.name});

  /*String get getName => name;

  set setName(String name) {
    this.name = name;
  }*/
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: t3_white,
    boxShadow: [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
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
