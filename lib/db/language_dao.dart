import 'package:findwords/db/language_repository.dart';
import 'package:findwords/model/language.dart';
import 'package:findwords/utils/constant.dart';
import 'package:sembast/sembast.dart';

class LanguageDAO extends LanguageRepository {
  @override
  StoreRef<int, Map<String, dynamic>> store =
      intMapStoreFactory.store(kTableLanguageName);

  @override
  Future<Language> getAppLanguage(String languageCode) async {
    final finder = Finder(filter: Filter.equals('locale', languageCode));
    var record = await store.findFirst(await db, finder: finder);
    if (record == null) return null;
    return Language().fromMapGeneric(record.value, record.key);
  }
}
