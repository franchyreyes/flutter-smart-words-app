import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:findwords/components/appbar_componet.dart';
import 'package:findwords/components/dialog_component.dart';
import 'package:findwords/components/textfield_component.dart';
import 'package:findwords/cubit/quiz/quiz_cubit.dart';
import 'package:findwords/db/language_dao.dart';
import 'package:findwords/db/quiz_dao.dart';
import 'package:findwords/locale/locales.dart';
import 'package:findwords/model/category.dart';
import 'package:findwords/model/quiz_detail.dart';
import 'package:findwords/utils/colors.dart';
import 'package:findwords/utils/constant.dart';
import 'package:findwords/utils/size_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class QuestionPage extends StatefulWidget {
  static String id = "QuestionPage_screen";

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  final LanguageDAO _languageDAO = LanguageDAO();
  final QuizDAO _quizDAO = QuizDAO();
  QuizCubit _quizCubit;
  final controller = TextEditingController();
  String userLetter;

  Category model;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Locale myLocale = Localizations.localeOf(context);
    _quizCubit = BlocProvider.of<QuizCubit>(context);
    final Map arguments = ModalRoute.of(context).settings.arguments;
    if (arguments != null) {
      this.model = arguments["model"] as Category;
      _languageDAO.getAppLanguage(myLocale.languageCode).then((language) {
        _quizCubit.getQuizWithQuestionDetail(model.documentID, language);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    userLetter = "";
    assetsAudioPlayer.open(
      Audio("images/fw.mp3"),
    );
    assetsAudioPlayer.playlistFinished.listen((finished) {
      if (finished) {
        if (assetsAudioPlayer.isPlaying.value) {
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(builder: (context, state) {
      print("hola");
      if (state is QuizLoadingState || state is QuizInitialState) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
              Color.fromRGBO(212, 20, 15, 1.0),
            ),
          ),
        );
      } else if (state is QuizCompletedCategoryState) {
        return DialogComponent();
      } else if (state is QuizLoadingOneQuestionState) {
        QuizDetail firstQuestionDetail = state.quiz.quizDetailsList
            .firstWhere((element) => element.completed != true);

        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: t3_app_background,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).categoryTitle() +
                " " +
                model.name),
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
                        gradient: LinearGradient(colors: <Color>[
                          t3_colorPrimary,
                          t3_colorPrimaryDark
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                      ),
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: 130,
                          height: 130,
                          decoration: new BoxDecoration(
                            color: t3_app_background,
                            shape: BoxShape.circle,
                          ),
                          child: Image(
                            image: AssetImage('images/${model.img}'),
                            width: displayWidth(context) * 0.22,
                          ),
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
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              width: displayWidth(context) * 0.80,
                              child: Text(
                                _quizDAO.showValidText(firstQuestionDetail.answer,userLetter),
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
                            TextFieldComponent(controller: controller,onChange: (value) {
                              {
                                if (controller.value.text.trim() != "") {
                                  userLetter =
                                      userLetter + controller.value.text;
                                  _quizCubit.checkWord(state.quiz);
                                  print(userLetter);
                                }
                              }}),
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
                              firstQuestionDetail.question,
                            style:
                                TextStyle(fontSize: 18, color: t3_icon_color),
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
            ],
          ),
        );
      } else {
        return Text('TESTING Question Page');
      }
    });
  }
}
