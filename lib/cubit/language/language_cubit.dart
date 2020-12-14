
import 'package:findwords/db/language_dao.dart';
import 'package:findwords/fake/FakeDB.dart';
import 'package:findwords/model/language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final LanguageDAO _languageDAO  = LanguageDAO();

  LanguageCubit() : super(LanguageInitialState());

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
      await _languageDAO.put(RandomLanguageGenerator.getRandomLanguage(0));
      await _languageDAO.put(RandomLanguageGenerator.getRandomLanguage(1));
      var languageList = await _languageDAO.getAll(Language());
      emit(LanguageLoadedState(languageList));
    } catch (e) {
      print(e.toString());
      emit(LanguageErrorState(e.toString()));
    }
  }

  Future<void> loadAllLanguage() async {
    try {
      await _languageDAO.deleteTable();
      await _languageDAO.put(RandomLanguageGenerator.getRandomLanguage(0));
      await _languageDAO.put(RandomLanguageGenerator.getRandomLanguage(1));
    } catch (e) {
      print("Error Language: " + e.toString());
    }
  }
}


