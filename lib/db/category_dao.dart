import 'package:findwords/db/category_repository.dart';
import 'package:findwords/model/category.dart';
import 'package:findwords/utils/constant.dart';
import 'package:sembast/sembast.dart';


class CategoryDAO extends CategoryRepository {

  @override
  StoreRef<int, Map<String,dynamic>> store = intMapStoreFactory.store(kTableCategoryName);

  Future<List<Category>> getAllCategory() async {

    var finder = Finder(sortOrders: [SortOrder("code", true)]);
    final recordSnapshot = await store.find(await db,finder: finder);

    if (recordSnapshot.isNotEmpty) {
      return recordSnapshot.map<Category>((snapshot) {
        return Category().fromMapGeneric(snapshot.value, snapshot.key);
      }).toList();
    }
    return null;
  }

}