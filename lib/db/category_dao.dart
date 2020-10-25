import 'package:findwords/db/category_repository.dart';
import 'package:findwords/db/sembast_database.dart';
import 'package:findwords/model/category.dart';
import 'package:findwords/utils/constant.dart';
import 'package:sembast/sembast.dart';


class CategoryDAO extends CategoryRepository {

  //var store = intMapStoreFactory.store(kTableCategoryName);

  @override
  StoreRef<int, Map<String,dynamic>> store = intMapStoreFactory.store(kTableCategoryName);





 // Future<Database> get _db async => await SemBastDatabase.instance.database;

  /*@override
  Future batchPut(List<Category> entities) async {
    if (entities == null) return null;
    final storeCategory = await store.find(await _db);
    if (storeCategory.isEmpty) {
      entities.forEach((entity) async {
        await store.add(await _db, entity.toMap());
      });
    }
  }

  Future<List<Category>> getAllCategory() async {
    final recordSnapshot = await store.find(await _db);
    if (recordSnapshot.isNotEmpty) {
      return recordSnapshot.map((snapshot) {
        final category = Category.fromMap(snapshot.value);
        return category;
      }).toList();
    }
    return null;
  }

  @override
  Future<Category> getByDocument(String id) async {
    final finder = Finder(
        filter: Filter.equals('categoryID', id)
        );
    var record = await store.findFirst(await _db, finder: finder);
    if (record == null) return null;

    return Category.fromMap(record.value);
  }

  Future<Category> getByKey(int key) async {
    final finder = Finder(filter: Filter.byKey(key));

    var record = await store.findFirst(await _db, finder: finder);
    if (record == null) return null;

    return Category.fromMap(record.value);
  }


  /*@override
  Future put(Category entity) async {
    await store.add(await _db, entity.toMap());
  }*/
*/


}