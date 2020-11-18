import 'package:findwords/cubit/category/category_cubit.dart';
import 'package:findwords/screen/HomePage.dart';
import 'package:findwords/screen/setting_page.dart';
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
    return MaterialApp(
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
        home: BlocProvider(
          create: (BuildContext context) => CategoryCubit(),
          child: HomePage(),
        ),
        routes: {
          HomePage.id: (context) => HomePage(),
          SettingPage.id: (context) => SettingPage(),
        });
  }
}
