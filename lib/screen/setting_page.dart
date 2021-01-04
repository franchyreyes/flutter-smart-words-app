import 'package:findwords/components/appbar_componet.dart';
import 'package:findwords/components/button_component.dart';
import 'package:findwords/components/curvenavigationbar_component.dart';
import 'package:findwords/cubit/category/category_cubit.dart';
import 'package:findwords/cubit/language/language_cubit.dart';
import 'package:findwords/cubit/quiz/quiz_cubit.dart';
import 'package:findwords/db/quiz_dao.dart';
import 'package:findwords/locale/locales.dart';
import 'package:findwords/repositories/cloud_firestore.dart';
import 'package:findwords/screen/category_page.dart';
import 'package:findwords/utils/Configuracion_difficulty.dart';
import 'package:findwords/utils/colors.dart';
import 'package:findwords/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SettingPage extends StatefulWidget {
  static String id = "SettingPage_screen";

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String difficultyGame;
  final _controller = FixedExtentScrollController();
  QuizDAO _quizDAO = QuizDAO();
  CategoryCubit _categoryCubit;
  LanguageCubit _languageCubit;
  QuizCubit _quizCubit;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showSpinner = false;

  void initState() {
    super.initState();
    wrapperGetDifficulty();
  }

  void wrapperGetDifficulty() async {
    await ConfigurationDifficulty.getDifficultySF().then((value) {
      setState(() {
        difficultyGame = value;
      });
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

  @override
  Widget build(BuildContext context) {
    dataList[0].name = AppLocalizations.of(context).easy();
    dataList[1].name = AppLocalizations.of(context).medium();
    dataList[2].name = AppLocalizations.of(context).hard();
    int _selectIndex = difficultyGame == STATUS_EASY
        ? 0
        : difficultyGame == STATUS_MEDIUM
            ? 1
            : difficultyGame == STATUS_HARD ? 2 : 2;

    _controller.jumpToItem(_selectIndex);
    return Scaffold(
      backgroundColor: t3_app_background,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).setting()),
        flexibleSpace: AppbarComponent(),
      ),
      body: ModalProgressHUD(
        color: Colors.red,
        inAsyncCall: _showSpinner,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        AppLocalizations.of(context).difficulty(),
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      padding: EdgeInsets.only(top: 25.0),
                      child: ListWheelScrollView.useDelegate(
                        onSelectedItemChanged: (value) {
                          switch (value) {
                            case 0:
                              ConfigurationDifficulty.setDifficultySF(
                                  Status.easy);
                              break;
                            case 1:
                              ConfigurationDifficulty.setDifficultySF(
                                  Status.medium);
                              break;
                            case 2:
                              ConfigurationDifficulty.setDifficultySF(
                                  Status.hard);
                              break;
                          }
                        },
                        physics: FixedExtentScrollPhysics(),
                        controller: _controller,
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
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                    Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      AppLocalizations.of(context).titleReset(),
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 35.0),
                      child: ButtonComponent(
                        textContent: AppLocalizations.of(context).yesReset() +
                            "                      ",
                        onPressed: () {
                          Alert(
                            context: context,
                            type: AlertType.warning,
                            title: AppLocalizations.of(context).titleReset(),
                            desc: AppLocalizations.of(context).textReset(),
                            buttons: [
                              DialogButton(
                                child: Text(
                                  AppLocalizations.of(context).yesReset(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _showSpinner = true;
                                    ConfigurationDifficulty.setDifficultySF(
                                        Status.easy);
                                    difficultyGame = STATUS_EASY;
                                    _quizDAO.resetGame();
                                    clearAllSharePreferences();

                                    Navigator.pop(context);
                                    Alert(
                                      context: context,
                                      type: AlertType.success,
                                      title: AppLocalizations.of(context)
                                          .titleReset(),
                                      desc: AppLocalizations.of(context)
                                          .completedReset(),
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .okReset(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          width: 120,
                                          color: Colors.green,
                                        )
                                      ],
                                    ).show();
                                    new Future.delayed(new Duration(seconds:2),
                                        () {
                                      setState(() {
                                        _showSpinner = false;
                                      });
                                    });

                                  });
                                },
                                color: Colors.green,
                              ),
                              DialogButton(
                                child: Text(
                                  AppLocalizations.of(context).noReset(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                color: Colors.red,
                              )
                            ],
                          ).show();
                        },
                      ),
                      color: null),
                ]),
                SizedBox(
                  height: 45,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                    Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      AppLocalizations.of(context).reloadGame(),
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 80.0),
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      color: t3_white,
                      icon: Icon(Icons.refresh),
                      tooltip: AppLocalizations.of(context).reloadGame(),
                      onPressed: () {
                        setState(() {
                          _showSpinner = true;
                          ConfigurationLoadingFirebase.getLoadingSF()
                              .then((valueSharedPreferences) {
                            final DateFormat formatter = DateFormat('yyyy-MM-dd');
                            final DateTime now = DateTime.now();
                            final String dateString = formatter.format(now);

                            if (valueSharedPreferences.trim() == "" ||
                                (formatter
                                    .parse(valueSharedPreferences)
                                    .isBefore(formatter.parse(dateString)))) {
                              CloudFireStore().loadData().then((check) {
                                if (check) {
                                  ConfigurationLoadingFirebase.setLoadingSF(
                                      value: dateString);
                                  Alert(
                                    context: context,
                                    type: AlertType.success,
                                    title:
                                    AppLocalizations.of(context).reloadGame(),
                                    desc: AppLocalizations.of(context)
                                        .successLoading(),
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          AppLocalizations.of(context).okReset(),
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        width: 120,
                                        color: Colors.green,
                                      )
                                    ],
                                  ).show();// som
                                } else {
                                  ConfigurationLoadingFirebase.setLoadingSF(
                                      value: "");
                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title:
                                        AppLocalizations.of(context).reloadGame(),
                                    desc: AppLocalizations.of(context)
                                        .errorLoadingTryAgain(),
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          AppLocalizations.of(context).okReset(),
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        width: 120,
                                        color: Colors.red,
                                      )
                                    ],
                                  ).show();
                                }
                              });
                            } else {
                              Alert(
                                context: context,
                                type: AlertType.info,
                                title: AppLocalizations.of(context).reloadGame(),
                                desc: AppLocalizations.of(context)
                                    .errorLoadingTryLater(),
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      AppLocalizations.of(context).okReset(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    width: 120,
                                    color: Colors.blue,
                                  )
                                ],
                              ).show();
                            }

                            new Future.delayed(new Duration(seconds:4),
                                    () {
                                  setState(() {
                                    _showSpinner = false;
                                  });
                                });
                          });
                        });
                      },
                    ),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    AppLocalizations.of(context).noteReloadGame(),
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
            if (index == 0) {
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
