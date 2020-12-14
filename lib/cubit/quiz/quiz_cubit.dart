import 'package:findwords/db/quiz_dao.dart';
import 'package:findwords/fake/FakeDB.dart';
import 'package:findwords/model/language.dart';
import 'package:findwords/model/quiz.dart';
import 'package:findwords/model/quiz_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final QuizDAO _quizDAO = QuizDAO();

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

  Future<void> getQuizWithQuestionDetail(
      String categoryDocumentID, Language language) async {
    try {
      emit(QuizLoadingState());
      final quiz = await _quizDAO.getQuizByCategoryAndLanguage(
          categoryDocumentID, language);
      print("categoryDocumentID: " + categoryDocumentID);
      print("language: " + language.documentID);
      print(quiz.quizDetailsList.length);
      bool completedQuestion =
          quiz.quizDetailsList.any((element) => element.completed != true);
      if (completedQuestion) {
        emit(QuizLoadingOneQuestionState(quiz));
      } else {
        emit(QuizCompletedCategoryState());
      }
    } catch (e) {
      emit(QuizErrorState(e.toString()));
      print(e.toString());
    }
  }

  Future<void> refreshScreen(Quiz quiz) async {
    try {
      emit(QuizLoadingOneQuestionState(quiz));
    } catch (e) {
      emit(QuizErrorState(e.toString()));
      print(e.toString());
    }
  }

  Future<void> updateCompletedQuestion(Quiz quiz, QuizDetail quizDetail) async {
    try {
      emit(QuizLoadingState());
      for (int i = 0; i < quiz.quizDetailsList.length; i++) {
        if (quiz.quizDetailsList[i].number == quizDetail.number) {
          print(quizDetail.answer);
          quiz.quizDetailsList[i].completed = true;
          break;
        }
      }

      _quizDAO.update(quiz);
      bool completedQuestion =
          quiz.quizDetailsList.any((element) => element.completed != true);
      if (completedQuestion) {
        emit(QuizLoadingOneQuestionState(quiz));
      } else {
        emit(QuizCompletedCategoryState());
      }
    } catch (e) {
      emit(QuizErrorState(e.toString()));
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
