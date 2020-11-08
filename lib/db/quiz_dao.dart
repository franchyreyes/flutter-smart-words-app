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
    var filterand = Filter.and([
      Filter.equals('categoryID', categoryDocumentID),
      Filter.equals('languageID', language.documentID)
    ]);
    var record =
        await store.findFirst(await db, finder: Finder(filter: filterand));
    if (record == null) return null;
    return Quiz().fromMapGeneric(record.value, record.key);
  }
}
