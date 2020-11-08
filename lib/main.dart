import 'package:findwords/cubit/category/category_cubit.dart';
import 'package:findwords/db/category_dao.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Colors.redAccent,
      ),
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        const Locale('en',''),
        const Locale('es',''),
      ],
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: BlocProvider(
          create: (BuildContext context) => CategoryCubit(),
          child: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoryCubit _categoryCubit;

  @override
  void initState() {
    super.initState();
    // Obtaining the FruitBloc instance through BlocProvider which is an InheritedWidget
    _categoryCubit = BlocProvider.of<CategoryCubit>(context);
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading fruits right from the start.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category app'),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _categoryCubit.addRandomCategory();
          }),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      Locale myLocale = Localizations.localeOf(context);
      if (state is CategoriesLoadingState) {
        return CircularProgressIndicator();
      } else if (state is CategoriesLoadedState) {
        return ListView.builder(
          itemCount: state.categoryList.length,
          itemBuilder: (context, index) {
            final displayedFruit = state.categoryList[index];
            return ListTile(
              title: Text(displayedFruit.name),
              subtitle: Text(displayedFruit.documentID),
            );
          },
        );
      } else {
        return Text(myLocale.languageCode);
      }
    });
  }
}
