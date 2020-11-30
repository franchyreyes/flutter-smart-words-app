import 'package:findwords/db/sembast_database.dart';
import 'package:findwords/model/generic_entity.dart';
import 'package:sembast/sembast.dart';

abstract class GenericRepository<T extends GenericEntity> {
  Future<Database> get db async => await SemBastDatabase.instance.database;

  StoreRef<int, Map<String, dynamic>> store;


  Future deleteTable() async {
    return await store.drop(await db);
  }

  Future put(T entity) async {
    return await store.add(await db, (entity).toMap());
  }

  Future batchPut(List<T> entities) async {
    if (entities == null) return null;
    final storeValues = await store.find(await db);
    if (storeValues.isEmpty) {
      entities.forEach((entity) async {
        await store.add(await db, entity.toMap());
      });
    }
  }

  Future<List<T>> getAll(T entity) async {

    final recordSnapshot = await store.find(await db);

    if (recordSnapshot.isNotEmpty) {
      return recordSnapshot.map<T>((snapshot) {
        return entity.fromMapGeneric(snapshot.value, snapshot.key);
      }).toList();
    }
    return null;
  }

  Future<T> getByKey(int key, T entity) async {
    final finder = Finder(filter: Filter.byKey(key));

    var record = await store.findFirst(await db, finder: finder);
    if (record == null) return null;
    return entity.fromMapGeneric(record.value, record.key);
  }

  Future<T> findByDocument(String document, T entity) async {
    final finder = Finder(filter: Filter.equals('documentID', document));
    var record = await store.findFirst(await db, finder: finder);
    if (record == null) return null;

    return entity.fromMapGeneric(record.value, record.key);
  }

  Future delete(T entity) async {
    final finder = Finder(filter: Filter.byKey(entity.id));
    await store.delete(
      await db,
      finder: finder,
    );
  }

  Future update(T entity) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(entity.id));
    await store.update(
      await db,
      entity.toMap(),
      finder: finder,
    );
  }
}
