import 'package:findwords/db/category_repository.dart';
import 'package:findwords/utils/constant.dart';
import 'package:sembast/sembast.dart';


class CategoryDAO extends CategoryRepository {

  @override
  StoreRef<int, Map<String,dynamic>> store = intMapStoreFactory.store(kTableCategoryName);

}