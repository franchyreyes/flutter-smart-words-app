import 'package:findwords/components/appbar_componet.dart';
import 'package:findwords/components/curvenavigationbar_component.dart';
import 'package:findwords/screen/HomePage.dart';
import 'package:findwords/screen/category_page.dart';
import 'package:findwords/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  static String id = "SettingPage_screen";

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: t3_app_background,
      appBar: AppBar(
        title: Text("Settings"),
        flexibleSpace: AppbarComponent(),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Difficulty: ",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.only(top: 25.0),
                  child: ListWheelScrollView.useDelegate(
                    physics: FixedExtentScrollPhysics(),
                    itemExtent: 75,
                    childDelegate: ListWheelChildBuilderDelegate(
                        builder: (BuildContext context, int index) {
                      if (index < 0 || index > 2) {
                        return null;
                      }
                      return ListTile(
                        leading: Icon(
                          dataList[index].images,
                          size: 30,
                          color: index == 0
                              ? t3_green
                              : index == 1 ? t3_icon_color : t3_red,
                        ),
                        title: Text(
                          dataList[index].name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: t3_black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar:
      Container(
        height: 100,
        color: t3_app_background,
        child: CurvedNavigationBar(
          animationDuration: Duration.zero,
          backgroundColor: t3_colorPrimaryDark,
          color: t3_app_background,
          initialIndex: 1,
          items: <Widget>[
            Icon(
              Icons.settings_applications,
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
            if(index == 0){
              Navigator.pushReplacementNamed(context, CategoryPage.id);
            }
          },
        ),
      ),

    );
  }
}

class DataModel {
  var images;
  var name;

  DataModel({
    this.images,
    this.name,
  });
}

List<DataModel> dataList = [
  DataModel(
    images: Icons.person,
    name: 'Easy',
  ),
  DataModel(
    images: Icons.person,
    name: 'Medium',
  ),
  DataModel(
    images: Icons.person,
    name: 'Hard',
  ),
];
