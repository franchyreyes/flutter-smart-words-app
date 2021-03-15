import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:findwords/components/appbar_componet.dart';
import 'package:findwords/components/dialog_component.dart';
import 'package:findwords/components/fail_component.dart';
import 'package:findwords/components/textfield_component.dart';
import 'package:findwords/cubit/quiz/quiz_cubit.dart';
import 'package:findwords/db/language_dao.dart';
import 'package:findwords/db/quiz_dao.dart';
import 'package:findwords/locale/locales.dart';
import 'package:findwords/model/category.dart';
import 'package:findwords/model/quiz_detail.dart';
import 'package:findwords/utils/Configuracion_difficulty.dart';
import 'package:findwords/utils/ad_manager.dart';
import 'package:findwords/utils/colors.dart';
import 'package:findwords/utils/constant.dart';
import 'package:findwords/utils/size_helper.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuestionPage extends StatefulWidget {
  static String id = "QuestionPage_screen";

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage>
    with WidgetsBindingObserver {
  final assetsAudioPlayer = AssetsAudioPlayer();
  final LanguageDAO _languageDAO = LanguageDAO();
  final QuizDAO _quizDAO = QuizDAO();
  QuizCubit _quizCubit;
  final controller = TextEditingController();
  String userLetter;
  FToast fToast;

  Category model;
  String difficultyGame;
  bool alternativeMedium;
  bool helpDialog = false;

  // TODO: Add _interstitialAd
  InterstitialAd _interstitialAd;

  // TODO: Add _isInterstitialAdReady
  bool _isInterstitialAdReady;

  // TODO: Implement _loadInterstitialAd()
  void _loadInterstitialAd() {
    _interstitialAd.load();
  }

  // TODO: Implement _onInterstitialAdEvent()
  void _onInterstitialAdEvent(MobileAdEvent event) {
    switch (event) {
      case MobileAdEvent.loaded:
        _isInterstitialAdReady = true;
        break;
      case MobileAdEvent.failedToLoad:
        _isInterstitialAdReady = false;
        print('Failed to load an interstitial ad');
        break;
      case MobileAdEvent.closed:
        _isInterstitialAdReady = false;
        break;
      default:
      // do nothing
    }
  }

  void wrapperGetDifficulty() async {
    await ConfigurationDifficulty.getDifficultySF().then((value) {
      setState(() {
        difficultyGame = value;
      });
    });
  }

  void wrapperGetDialogHelp() async {
    await ConfigurationDialogHelp.getDialogoHelpSF().then((value) {
      setState(() {
        helpDialog = value;
      });
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    fToast.init(context);
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
    // TODO: Initialize _isInterstitialAdReady
    _isInterstitialAdReady = false;

    // TODO: Initialize _interstitialAd
    _interstitialAd = InterstitialAd(
      adUnitId: AdManager.interstitialAdUnitId,
      listener: _onInterstitialAdEvent,
    );

    super.initState();
    WidgetsBinding.instance.addObserver(this);
    fToast = FToast();

    wrapperGetDifficulty();
    wrapperGetDialogHelp();
    userLetter = "";
    alternativeMedium = false;
    _loadInterstitialAd();
    assetsAudioPlayer.setVolume(0.1);
    assetsAudioPlayer.open(
      Audio("images/fw.mp3"),
      respectSilentMode: true,
    );

    assetsAudioPlayer.playlistFinished.listen((finished) {
      if (finished) {
        if (assetsAudioPlayer.isPlaying.value) {
          assetsAudioPlayer.open(Audio("images/fw.mp3"),
              respectSilentMode: true);
          assetsAudioPlayer.setVolume(0.1);
        }
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        assetsAudioPlayer.stop();
        break;
      case AppLifecycleState.resumed:
        assetsAudioPlayer.open(
          Audio("images/fw.mp3"),
          respectSilentMode: true,
        );
        assetsAudioPlayer.setVolume(0.1);
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    assetsAudioPlayer.dispose();
    _interstitialAd?.dispose();
  }

  Widget _showToast(String letter, BuildContext con) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(AppLocalizations.of(con).toastGood() + " (" + letter + ") "),
        ],
      ),
    );

    return toast;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(builder: (context, state) {
      if (state is QuizLoadingState || state is QuizInitialState) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
              Color.fromRGBO(212, 20, 15, 1.0),
            ),
          ),
        );
      } else if (state is QuizCompletedCategoryState) {
        return DialogComponent(
          title: AppLocalizations.of(context).questionDialogTitle(),
          description: AppLocalizations.of(context).questionDialogText(),
          textButton: AppLocalizations.of(context).questionDialogButton(),
          color: Colors.green,
          duration: false,
          onPressed: () {
            Navigator.pop(context);
          },
          onPressed2: () {
            Navigator.pop(context);
          },
        );
      } else if (state is QuizLoadingOneQuestionState) {
        QuizDetail firstQuestionDetail = state.quiz.quizDetailsList
            .firstWhere((element) => element.completed != true);
        String secretText =
            _quizDAO.showValidText(firstQuestionDetail.answer, userLetter);
        int totalFail =
            _quizDAO.failValidText(firstQuestionDetail.answer, userLetter);
        int failByFail = _quizDAO.failValidText(
            firstQuestionDetail.answer, controller.value.text);
        String status = firstQuestionDetail.question;

        if (difficultyGame == STATUS_EASY) {
          status = firstQuestionDetail.question;
        } else if (difficultyGame == STATUS_MEDIUM) {
          status = (alternativeMedium)
              ? firstQuestionDetail.question
              : AppLocalizations.of(context).statusMedium() +
                  " " +
                  AppLocalizations.of(context).goToSetting();
        } else {
          status = AppLocalizations.of(context).statusHard() +
              " " +
              AppLocalizations.of(context).goToSetting();
        }

        if (totalFail >= kAllowTotalFail) {
          return DialogComponent(
            title: AppLocalizations.of(context).dialogTitleFailQuestion(),
            description: AppLocalizations.of(context).dialogTextFailQuestion(),
            textButton: AppLocalizations.of(context).dialogButtonFailQuestion(),
            color: Colors.red,
            duration: false,
            onPressed: () {
              setState(() {
                userLetter = "";
                controller.text = "";
                _quizCubit.refreshScreen(state.quiz);
              });
            },
            onPressed2: () {
              setState(() {
                userLetter = "";
                controller.text = "";
                _quizCubit.refreshScreen(state.quiz);
              });
            },
          );
        } else if (!secretText.contains(kUnderScore)) {
          return DialogComponent(
            title: AppLocalizations.of(context).questionDialogTitle(),
            description: AppLocalizations.of(context).dialogTextEndQuestion(),
            textButton: AppLocalizations.of(context).dialogButtonEndQuestion(),
            color: Colors.green,
            duration: false,
            onPressed: () {
              setState(() {
                userLetter = "";
                controller.text = "";
                alternativeMedium = true;
                _quizCubit.updateCompletedQuestion(
                    state.quiz, firstQuestionDetail);
              });
            },
            onPressed2: () {
              setState(() {
                userLetter = "";
                controller.text = "";
                alternativeMedium = true;
                _quizCubit.updateCompletedQuestion(
                    state.quiz, firstQuestionDetail);
              });
            },
          );
        } else if (failByFail == kAllowFail) {
          return DialogComponent(
            title: AppLocalizations.of(context).dialogTitleFailQuestion(),
            description:
                AppLocalizations.of(context).dialogTextFailByFailQuestion() +
                    " ( " +
                    controller.value.text +
                    " ) ",
            textButton:
                AppLocalizations.of(context).dialogButtonFailByFailQuestion(),
            color: Colors.red,
            duration: true,
            onPressed: () {
              setState(() {
                controller.text = "";
                _quizCubit.refreshScreen(state.quiz);
              });
            },
            onPressed2: () {
              setState(() {
                controller.text = "";
                _quizCubit.refreshScreen(state.quiz);
              });
            },
          );
        } else if (!helpDialog) {
          return DialogComponent(
            title: AppLocalizations.of(context).questionDialogTitleHelp(),
            description: AppLocalizations.of(context).questionDialogDescriptioneHelp(),
            textButton: AppLocalizations.of(context).okReset(),
            color: Colors.blue,
            duration: false,
            onPressed: () {
              setState(() {
                helpDialog = true;
                 ConfigurationDialogHelp.setDialogoHelpSF();
              });

            },
            onPressed2: () {
              setState(() {
                helpDialog = true;
                ConfigurationDialogHelp.setDialogoHelpSF();
              });
            },
          );
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if ((failByFail == 0) && (controller.value.text != "")) {
              fToast.showToast(
                child: _showToast(controller.value.text, context),
                gravity: ToastGravity.CENTER,
                toastDuration: Duration(seconds: 1),
              );
              controller.text = "";
            }
            // Add Your Code here.
          });

          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: t3_app_background,
            appBar: AppBar(
              title:Text(AppLocalizations.of(context).categoryTitle() +
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
                                  border: Border.all(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                width: displayWidth(context) * 0.80,
                                child: Text(
                                  secretText,
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
                              TextFieldComponent(
                                  controller: controller,
                                  onChange: (value) {
                                    {
                                      if (_isInterstitialAdReady) {
                                        _interstitialAd.show();
                                      }
                                      if (controller.value.text.trim() != "") {
                                        userLetter =
                                            userLetter + controller.value.text;
                                        setState(() {
                                          _quizCubit.refreshScreen(state.quiz);
                                        });
                                      }
                                    }
                                  }),
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
                              status,
                              style:
                                  TextStyle(fontSize: 18, color: t3_icon_color),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .questionIntent()
                                    .replaceAll(
                                        '3', (3 - totalFail).toString()),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: textSizeLargeMedium,
                                    color: t3_colorPrimary),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              FailComponent(intent: totalFail)
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
        }
      } else if (state is QuizErrorState) {
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
}
