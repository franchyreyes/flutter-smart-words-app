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
  void loadData() {
    convertFutureToList();
    if ((categoryList != null) &&
        (languageList != null) &&
        (quizList != null)) {
      categoryDAO.batchPut(categoryList);
      languageDAO.batchPut(languageList);
      quizDAO.batchPut(quizList);
    }
  }

  void convertFutureToList() async {
    categoryList = await getAllCategory();
    languageList = await getAllLanguage();
    quizList = await getAllQuiz();
  }

  Future<List<Language>> getAllLanguage() async {
    List<Language> languageList = [];
    await FirebaseFirestore.instance
        .collection(kTableLanguageName)
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
        .collection(kTableCategoryName)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        categoryList
            .add(Category.fromDocumentWithID(document.data(), document.id));
      });
    });
    return categoryList;
  }

  Future<List<Quiz>> getAllQuiz() async {
    List<Quiz> quizList = [];
    await FirebaseFirestore.instance
        .collection(kTableQuizName)
        .doc('7Gax3pSD2s2WtSihDZX5')
        .get()
        .then((querySnapshot) {
      quizList
          .add(Quiz.fromDocumentWithID(querySnapshot.data(), querySnapshot.id));
    });

    return quizList;
  }
}
