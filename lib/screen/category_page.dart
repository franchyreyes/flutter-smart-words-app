import 'dart:ui';

import 'package:findwords/components/category_component.dart';
import 'package:findwords/components/curvenavigationbar_component.dart';
import 'package:findwords/cubit/category/category_cubit.dart';
import 'package:findwords/locale/locales.dart';
import 'package:findwords/model/category.dart';
import 'package:findwords/screen/setting_page.dart';
import 'package:findwords/utils/colors.dart';
import 'package:findwords/utils/constant.dart';
import 'package:findwords/utils/size_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CategoryPage extends StatefulWidget {
  static String id = "CategoryPage_screen";

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CategoryCubit _categoryCubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _categoryCubit = BlocProvider.of<CategoryCubit>(context);
    _categoryCubit.reloadCategory();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);

    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      if (state is CategoriesLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
              Color.fromRGBO(212, 20, 15, 1.0),
            ),
          ),
        );
      } else if (state is CategoriesLoadedState) {
        return Scaffold(
          key: _scaffoldKey,
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
                        gradient: LinearGradient(colors: <Color>[
                          t3_colorPrimary,
                          t3_colorPrimaryDark
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                      ),
                      //color: _randomColor.randomColor(colorBrightness: ColorBrightness.light),
                      child: Container(
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          AppLocalizations.of(context).welcome() +
                              ' \n Find Words',
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
                            AppLocalizations.of(context).categorySelect(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: displayWidth(context) * 0.07,
                                color: t3_colorPrimaryDark,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.categoryList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (myLocale.languageCode == 'es') {
                              state.categoryList[index].name =
                                  findSpanishText(index, context);
                            }

                            return CategoryComponent(state.categoryList[index]);
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
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
                if (index == 1) {
                  Navigator.pushReplacementNamed(context, SettingPage.id);
                }
              },
            ),
          ),
        );
      } else if (state is CategoryErrorState) {
        return Center(
          child: Text(
            AppLocalizations.of(context).errorLoading(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: textSizeLarge,
                color: t3_colorPrimary),
          ),
        );
      } else {
        return Text('');
      }
    });
  }

  String findSpanishText(index, BuildContext context) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context).fruit();
        break;
      case 1:
        return AppLocalizations.of(context).things();
        break;
      case 2:
        return AppLocalizations.of(context).sport();
        break;
      case 3:
        return AppLocalizations.of(context).animal();
        break;
      case 4:
        return AppLocalizations.of(context).body();
        break;
      case 5:
        return AppLocalizations.of(context).all();
        break;
      default:
        return "";
        break;
    }
  }
}
