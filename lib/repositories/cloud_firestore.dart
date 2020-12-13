import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findwords/db/category_dao.dart';
import 'package:findwords/db/language_dao.dart';
import 'package:findwords/db/quiz_dao.dart';
import 'package:findwords/model/category.dart';
import 'package:findwords/model/language.dart';
import 'package:findwords/model/quiz.dart';
import 'package:findwords/repositories/cloud_repository_interface.dart';
import 'package:findwords/utils/constant.dart';

class CloudFireStore implements ICloudRepository {
  CategoryDAO categoryDAO = CategoryDAO();
  LanguageDAO languageDAO = LanguageDAO();
  QuizDAO quizDAO = QuizDAO();

  List<Category> categoryList;
  List<Language> languageList;
  List<Quiz> quizList;

  @override
  Future<bool> loadData() async {
    convertFutureToList();
    if ((categoryList != null) &&
        (languageList != null) &&
        (quizList != null)) {
      await categoryDAO.deleteTable();
      await languageDAO.deleteTable();
      await quizDAO.deleteTable();
      await categoryDAO.batchPut(categoryList);
      await languageDAO.batchPut(languageList);
      await quizDAO.batchPut(quizList);
      return true;
    }
    return false;
  }

  void convertFutureToList() async {
    categoryList = await getAllCategory();
    languageList = await getAllLanguage();
    quizList = await getAllQuiz();
    await Future.delayed(const Duration(seconds: 5));
  }

  Future<List<Language>> getAllLanguage() async {
    List<Language> languageList = [];
    await Firestore.instance
        .collection(kTableLanguageName)
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((document) {
        languageList.add(
            Language.fromDocumentWithID(document.data, document.documentID));
      });
    });
    return languageList;
  }

  Future<List<Category>> getAllCategory() async {
    List<Category> categoryList = [];
    await Firestore.instance
        .collection(kTableCategoryName)
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((document) {
        categoryList.add(
            Category.fromDocumentWithID(document.data, document.documentID));
      });
    });
    return categoryList;
  }

  Future<List<Quiz>> getAllQuiz() async {
    List<Quiz> quizList = [];
    await Firestore.instance
        .collection(kTableQuizName)
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((document) {
        quizList
            .add(Quiz.fromDocumentWithID(document.data, document.documentID));
      });
    });

    return quizList;
  }
}
