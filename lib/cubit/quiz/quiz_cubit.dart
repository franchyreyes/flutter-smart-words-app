import 'dart:convert';

import 'package:findwords/db/quiz_dao.dart';
import 'package:findwords/fake/FakeDB.dart';
import 'package:findwords/model/language.dart';
import 'package:findwords/model/quiz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final QuizDAO _quizDAO  = QuizDAO();

  QuizCubit() : super(QuizInitialState());

  Future<void> reloadQuiz() async {
    try {
      emit(QuizLoadingState());
      final quizList = await _quizDAO.getAll(Quiz());
      emit(QuizLoadedState(quizList));
    } catch (e) {
      emit(QuizErrorState(e.toString()));
    }
  }

  Future<void> getQuestion(String categoryDocumentID, Language language) async {
    try {
      emit(QuizLoadingState());
      final quizList = await _quizDAO.getQuizByCategoryAndLanguage(categoryDocumentID, language);
      emit(QuizLoadingOneQuestionState(quizList));
    } catch (e) {
      //emit(QuizErrorState(e.toString()));
      print(e.toString());
    }
  }

  Future<void> loadAllQuiz() async {
    try {
      await _quizDAO.deleteTable();
      await _quizDAO.put(RandomQuizGenerator.getRandomQuiz(0));
      await _quizDAO.put(RandomQuizGenerator.getRandomQuiz(1));
      await _quizDAO.put(RandomQuizGenerator.getRandomQuiz(2));
      await _quizDAO.put(RandomQuizGenerator.getRandomQuiz(3));
      await _quizDAO.put(RandomQuizGenerator.getRandomQuiz(4));
      await _quizDAO.put(RandomQuizGenerator.getRandomQuiz(5));
      await _quizDAO.put(RandomQuizGenerator.getRandomQuiz(6));
      await _quizDAO.put(RandomQuizGenerator.getRandomQuiz(7));
      await _quizDAO.put(RandomQuizGenerator.getRandomQuiz(8));
      await _quizDAO.put(RandomQuizGenerator.getRandomQuiz(9));

    } catch (e) {
      print("Error loadAllQuiz: " + e.toString());
    }
  }

}


