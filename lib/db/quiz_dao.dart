import 'package:findwords/db/quiz_repository.dart';
import 'package:findwords/model/language.dart';
import 'package:findwords/model/quiz.dart';
import 'package:findwords/utils/constant.dart';
import 'package:sembast/sembast.dart';

class QuizDAO extends QuizRepository {
  @override
  StoreRef<int, Map<String, dynamic>> store =
      intMapStoreFactory.store(kTableQuizName);

  @override
  Future<Quiz> getQuizByCategoryAndLanguage(
      String categoryDocumentID, Language language) async {
    var filterAnd = Filter.and([
      Filter.equals('categoryID', categoryDocumentID),
      Filter.equals('languageID', language.documentID)
    ]);
    var record =
        await store.findFirst(await db, finder: Finder(filter: filterAnd));
    if (record == null) return null;
    return Quiz().fromMapGeneric(record.value, record.key);
  }

  String showValidText(String answer, String userLetter) {
    String value = "";
    String underScore = "_";
    bool find = false;
    for (int index = 0; index < answer.length; index++) {
      for (int row = 0; row < userLetter.length; row++) {
        if (answer[index] == userLetter[row]) {
          value = value + answer[index];
          find = true;
          break;
        }
      }
      if (!find) {
        value = value + underScore;
      }
      find = false;
    }
    return value;
  }
}
