import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:findwords/db/category_dao.dart';
import 'package:findwords/db/language_dao.dart';
import 'package:findwords/model/category.dart';
import 'package:findwords/model/language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class CategoryCubit extends Cubit<LanguageState> {
  final LanguageDAO _languageDAO  = LanguageDAO();

  CategoryCubit() : super(LanguageInitialState());

  Future<void> reloadLanguage() async {
    try {
      emit(LanguageLoadingState());
      final languageList = await _languageDAO.getAll(Language());
      emit(LanguageLoadedState(languageList));
    } catch (e) {
      emit(LanguageErrorState(e.toString()));
    }
  }

  Future<void> addAllLanguage() async {
    try {
      emit(LanguageLoadingState());
      await _languageDAO.put(RandomCategoryGenerator.getRandomLanguage(0));
      await _languageDAO.put(RandomCategoryGenerator.getRandomLanguage(1));
      var languageList = await _languageDAO.getAll(Language());
      emit(LanguageLoadedState(languageList));
    } catch (e) {
      print(e.toString());
      emit(LanguageErrorState(e.toString()));
    }
  }
}

class RandomCategoryGenerator {
  static final _languages = [
    Language(locale: 'es', documentID: "1x"),
    Language(locale: 'en', documentID: "2x"),
  ];

  static Language getRandomLanguage(int length) {
    return _languages[length];
  }
}
