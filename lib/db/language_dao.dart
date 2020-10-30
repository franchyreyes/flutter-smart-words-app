import 'package:findwords/db/language_repository.dart';
import 'package:findwords/utils/constant.dart';
import 'package:sembast/sembast.dart';

class LanguageDAO extends LanguageRepository {
  @override
  StoreRef<int, Map<String,dynamic>> store = intMapStoreFactory.store(kTableLanguageName);

}