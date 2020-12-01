import 'package:findwords/db/generic_repository_interface.dart';
import 'package:findwords/model/category.dart';

abstract class CategoryRepository extends GenericRepository<Category>{

  Future<List<Category>> getAllCategory();
}