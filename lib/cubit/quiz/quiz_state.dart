part of 'quiz_cubit.dart';


abstract class QuizState{
}

class QuizInitialState extends QuizState {

}

class QuizLoadedState extends QuizState {
  final List<Quiz> quizList;

  QuizLoadedState(this.quizList);


  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuizLoadedState && o.quizList == quizList;
  }

  @override
  int get hashCode => quizList.hashCode;
}



class QuizErrorState extends QuizState {
  final String message;
  QuizErrorState(this.message);


  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuizErrorState && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;

}

class QuizLoadingState extends QuizState {}
class QuizCompletedCategoryState extends QuizState {}

class QuizLoadingOneQuestionState extends QuizState {

  final Quiz quiz;

  QuizLoadingOneQuestionState(this.quiz);


  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuizLoadingOneQuestionState && o.quiz == quiz;
  }

  @override
  int get hashCode => quiz.hashCode;
}