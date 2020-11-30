import 'package:findwords/cubit/category/category_cubit.dart';
import 'package:findwords/cubit/language/language_cubit.dart';
import 'package:findwords/cubit/quiz/quiz_cubit.dart';
import 'package:findwords/screen/HomePage.dart';
import 'package:findwords/screen/category_page.dart';
import 'package:findwords/screen/question_page.dart';
import 'package:findwords/screen/setting_page.dart';
import 'package:findwords/screen/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'locale/locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(
            create: (BuildContext context) => CategoryCubit()
        ),
        BlocProvider<LanguageCubit>(
            create: (BuildContext context) => LanguageCubit()
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          supportedLocales: [
            const Locale('en', ''),
            const Locale('es', ''),
          ],
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: SplashPage(),
          routes: {
            HomePage.id: (context) => HomePage(),
            SettingPage.id: (context) => SettingPage(),
            QuestionPage.id: (context) => QuestionPage(),
            CategoryPage.id: (context) => CategoryPage(),
          }),
    );
  }
}
