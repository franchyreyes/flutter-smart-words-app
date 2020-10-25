import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findwords/db/category_dao.dart';
import 'package:findwords/model/category.dart';
import 'package:findwords/model/language.dart';
import 'package:findwords/repositories/cloud_repository_interface.dart';

class CloudFireStore implements ICloudRepository {
  CategoryDAO categoryDAO = CategoryDAO();
  List<Category> categoryList;

  @override
  void loadData() {
    //getAllLanguage();
     convertFutureToList();
    if(categoryList == null){
      print("Is laoding");
    }
    //categoryDAO.batchPut(categoryList);
    categoryDAO.getByKey(1,Category());
  }

  void convertFutureToList() async {
    categoryList = await getAllCategory();
  }

  Future<List<Language>> getAllLanguage() async {
    List<Language> languageList = [];
    await FirebaseFirestore.instance
        .collection("language")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        languageList
            .add(Language.fromDocumentWithID(document.data(), document.id));
      });
    });
    return languageList;
  }

  Future<List<Category>> getAllCategory() async {
    List<Category> categoryList = [];
    await FirebaseFirestore.instance
        .collection("category")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        categoryList
            .add(Category.fromDocumentWithID(document.data(), document.id));
      });
    });
    return categoryList;
  }
}
