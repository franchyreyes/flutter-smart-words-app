import 'package:findwords/db/generic_repository_interface.dart';
import 'package:findwords/model/language.dart';
import 'package:findwords/model/quiz.dart';

abstract class QuizRepository extends GenericRepository<Quiz>{

  Future<Quiz> getQuizByCategoryAndLanguage(String categoryDocumentID, Language language);
}