import 'dart:ui';

import 'package:findwords/components/category_component.dart';
import 'package:findwords/components/curvenavigationbar_component.dart';
import 'package:findwords/locale/locales.dart';
import 'package:findwords/model/category.dart';
import 'package:findwords/screen/setting_page.dart';
import 'package:findwords/utils/colors.dart';
import 'package:findwords/utils/constant.dart';
import 'package:findwords/utils/size_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CategoryPage extends StatefulWidget {
  static String id = "CategoryPage_screen";

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  List<Category> listCategoryModel = [
    Category(name:"Fruits", img:'dd'),
    Category(name:"Fruits", img:'dd'),
    Category(name:"Fruits", img:'dd'),
    Category(name:"Fruits", img:'dd'),
    Category(name:"Fruits", img:'dd')

  ];

  @override
  Widget build(BuildContext context) {
    listCategoryModel[0].name = AppLocalizations.of(context).fruit();
    listCategoryModel[1].name = AppLocalizations.of(context).things();
    listCategoryModel[2].name = AppLocalizations.of(context).sport();
    listCategoryModel[3].name = AppLocalizations.of(context).animal();
    listCategoryModel[4].name = AppLocalizations.of(context).body();
    listCategoryModel[5].name = AppLocalizations.of(context).all();

    return Scaffold(
      appBar: null,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ClipPath(
              clipper: WaveClipperTwo(flip: true),
              child: Container(
                  width: displaySize(context).width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[t3_colorPrimary, t3_colorPrimaryDark]),
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  ),
                  //color: _randomColor.randomColor(colorBrightness: ColorBrightness.light),
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      AppLocalizations.of(context).welcome() + ' \n Find Words',
                      style: TextStyle(
                        color: t3_white,
                        fontSize: displayWidth(context) * 0.10,
                      ),
                    ),
                  )),
            ),
          ),
          Expanded(
          flex: 2,
            child: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: displayWidth(context) * 0.80,
                      child: Text(
                        AppLocalizations.of(context).categorySelect() ,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: displayWidth(context) * 0.07,
                            color: t3_colorPrimaryDark,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: listCategoryModel.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CategoryComponent(listCategoryModel[index]);
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: t3_app_background,
        child: CurvedNavigationBar(
          animationDuration: Duration.zero,
          backgroundColor: t3_colorPrimaryDark,
          color: t3_app_background,

          items: <Widget>[
            Icon(
              Icons.home,
              color: t3_icon_color,
              size: 30.0,
            ),
            Icon(
              Icons.settings_applications,
              color: t3_icon_color,
              size: 30.0,
            )

          ],
          onTap: (index) {
            //Handle button tap
            if(index == 1){
              Navigator.pushReplacementNamed(context, SettingPage.id);
            }
          },
        ),
      ),
    );
  }
}
