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

  void resetGame() {
    Future<List<Quiz>> quizList = this.getAll(Quiz());
    if (quizList != null) {
      quizList.then((list) {
        for (int index = 0; index < list.length; index++) {
          for (int i = 0; i < list[index].quizDetailsList.length; i++) {
            list[index].quizDetailsList[i].completed = false;
          }
          this.update(list[index]);
        }
      });
    }
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

  int failValidText(String answer, String userLetter) {
    bool find = true;
    int fail = 0;
    if (userLetter.trim() == "") {
      return fail;
    }
    for (int row = 0; row < userLetter.length; row++) {
      for (int index = 0; index < answer.length; index++) {
        if (answer[index] == userLetter[row]) {
          find = false;
          break;
        }
      }
      if (find) {
        fail = fail + 1;
      }
      find = true;
    }
    return fail;
  }
}
