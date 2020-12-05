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
      'Good Job!. You find it.',
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




  /* End  Question Page*/


  /* Begin  Category Page*/
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