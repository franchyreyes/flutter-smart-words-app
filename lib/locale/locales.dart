import 'package:findwords/l10n/messages_all.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';



class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) async {
    final String name =
    locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return await initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      //print(Intl.defaultLocale);
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /* Begin  Question Page*/
  String categoryTitle() {
    return Intl.message(
      'Category',
      name: 'categoryTitle',
      desc: 'categoryTitle of the application',
    );
  }

  String questionSubTitle() {
    return Intl.message(
      'Find the words',
      name: 'questionSubTitle',
      desc: 'questionSubTitle of the application',
    );
  }

  String questionField() {
    return Intl.message(
      'Write the letters here',
      name: 'questionField',
      desc: 'questionField of the application',
    );
  }

  String questionHelp() {
    return Intl.message(
      'Idea or Help',
      name: 'questionHelp',
      desc: 'questionHelp of the application',
    );
  }

  String questionIntent() {
    return Intl.message(
      'You got 3 intent',
      name: 'questionIntent',
      desc: 'questionIntent of the application',
    );
  }

  String questionDialogTitle() {
    return Intl.message(
      'Congratulations!',
      name: 'questionDialogTitle',
      desc: 'questionDialogTitle of the application',
    );
  }

  String questionDialogText() {
    return Intl.message(
      'This category is completed.',
      name: 'questionDialogText',
      desc: 'questionDialogText of the application',
    );
  }
  String questionDialogButton() {
    return Intl.message(
      'Change the category',
      name: 'questionDialogButton',
      desc: 'questionDialogButton of the application',
    );
  }

  String dialogTextEndQuestion() {
    return Intl.message(
      'Good Job!. You found it.',
      name: 'dialogTextEndQuestion',
      desc: 'dialogTextEndQuestion of the application',
    );
  }

  String dialogButtonEndQuestion() {
    return Intl.message(
      'Next question',
      name: 'dialogButtonEndQuestion',
      desc: 'dialogButtonEndQuestion of the application',
    );
  }



  String dialogTitleFailQuestion() {
    return Intl.message(
      'You failed!',
      name: 'dialogTitleFailQuestion',
      desc: 'dialogTitleFailQuestion of the application',
    );
  }
  String dialogTextFailQuestion() {
    return Intl.message(
      'You could not find the answer',
      name: 'dialogTextFailQuestion',
      desc: 'dialogTextFailQuestion of the application',
    );
  }

  String dialogButtonFailQuestion() {
    return Intl.message(
      'Try again',
      name: 'dialogButtonFailQuestion',
      desc: 'dialogButtonFailQuestion of the application',
    );
  }

  String dialogButtonFailByFailQuestion() {
    return Intl.message(
      'keep trying',
      name: 'dialogButtonFailByFailQuestion',
      desc: 'dialogButtonFailByFailQuestion of the application',
    );
  }

  String dialogTextFailByFailQuestion() {
    return Intl.message(
      'This letter is incorrect',
      name: 'dialogTextFailByFailQuestion',
      desc: 'dialogTextFailByFailQuestion of the application',
    );
  }

  String errorLoading() {
    return Intl.message(
      'Error loading the data',
      name: 'errorLoading',
      desc: 'errorLoading of the application',
    );
  }

  String errorLoadingTryLater() {
    return Intl.message(
      'You can only use this option once a day. Error loading the data',
      name: 'errorLoadingTryLater',
      desc: 'errorLoadingTryLater of the application',
    );
  }
  String noteReloadGame() {
    return Intl.message(
      'NOTE: By default, the application has the data. However, this action updates the new questions from the cloud(INTERNET), if it finds new ones.',
      name: 'noteReloadGame',
      desc: 'noteReloadGame of the application',
    );
  }

  String errorLoadingTryAgain() {
    return Intl.message(
      'Error loading the data. Try again',
      name: 'errorLoadingTryAgain',
      desc: 'errorLoadingTryAgain of the application',
    );
  }
  String successLoading() {
    return Intl.message(
      'the data was updated successfully',
      name: 'successLoading',
      desc: 'successLoading of the application',
    );
  }

  String statusMedium() {
    return Intl.message(
      'The difficulty of the game is medium, sometimes we will show you a brief summary and sometimes not.',
      name: 'statusMedium',
      desc: 'statusMedium of the application',
    );
  }
  String goToSetting() {
    return Intl.message(
      'If you want to change the difficulty of the game. Go to settings',
      name: 'goToSetting',
      desc: 'goToSetting of the application',
    );
  }

  String statusHard() {
    return Intl.message(
      'The difficulty of the game is hard, you cannot see the brief summary',
      name: 'statusHard',
      desc: 'statusHard of the application',
    );
  }



  /* End  Question Page*/


  /* Begin  Category Page*/

  String titleReset() {
    return Intl.message(
      'Reset the game',
      name: 'titleReset',
      desc: 'titleReset of the application',
    );
  }

  String textReset() {
    return Intl.message(
      'Are you sure you want to reset the game?',
      name: 'textReset',
      desc: 'textReset of the application',
    );
  }
  String yesReset() {
    return Intl.message(
      'Yes',
      name: 'yesReset',
      desc: 'yesReset of the application',
    );
  }
  String noReset() {
    return Intl.message(
      'No',
      name: 'noReset',
      desc: 'noReset of the application',
    );
  }

  String okReset() {
    return Intl.message(
      'OK',
      name: 'okReset',
      desc: 'okReset of the application',
    );
  }

  String completedReset() {
    return Intl.message(
      'This game was restarted successfully!',
      name: 'completedReset',
      desc: 'completedReset of the application',
    );
  }
  String reloadGame() {
    return Intl.message(
      'Reload data',
      name: 'reloadGame',
      desc: 'reloadGame of the application',
    );
  }


  String welcome() {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: 'welcome of the application',
    );
  }

  String fruit() {
    return Intl.message(
      'Fruits',
      name: 'fruit',
      desc: 'fruit of the application',
    );
  }
  String sport() {
    return Intl.message(
      'Sports',
      name: 'sport',
      desc: 'sport of the application',
    );
  }

  String things() {
    return Intl.message(
      'Things',
      name: 'things',
      desc: 'things of the application',
    );
  }

  String all() {
    return Intl.message(
      'Combination',
      name: 'all',
      desc: 'all of the application',
    );
  }

  String animal() {
    return Intl.message(
      'Animals',
      name: 'animal',
      desc: 'animal of the application',
    );
  }
  String body() {
    return Intl.message(
      'Body',
      name: 'body',
      desc: 'body of the application',
    );
  }

  String categorySelect() {
    return Intl.message(
      'Select the category',
      name: 'categorySelect',
      desc: 'categorySelect of the application',
    );
  }


  /* fin  Category Page*/

  /* Begin  Home Page*/

  String home() {
    return Intl.message(
      'Home',
      name: 'home',
      desc: 'home of the application',
    );
  }
  /* Fin  Home Page*/

  /* Begin  Setting Page*/
  String setting() {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: 'setting of the application',
    );
  }

  String difficulty() {
    return Intl.message(
      'Difficulty',
      name: 'difficulty',
      desc: 'difficulty of the application',
    );
  }

  String easy() {
    return Intl.message(
      'Easy',
      name: 'easy',
      desc: 'easy of the application',
    );
  }

  String medium() {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: 'medium of the application',
    );
  }

  String hard() {
    return Intl.message(
      'Hard',
      name: 'hard',
      desc: 'hard of the application',
    );
  }

 /* End Setting Page*/
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['es', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}