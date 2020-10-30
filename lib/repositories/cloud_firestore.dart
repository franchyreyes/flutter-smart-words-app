import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findwords/db/category_dao.dart';
import 'package:findwords/db/language_dao.dart';
import 'package:findwords/db/quiz_dao.dart';
import 'package:findwords/model/category.dart';
import 'package:findwords/model/language.dart';
import 'package:findwords/model/quiz.dart';
import 'package:findwords/repositories/cloud_repository_interface.dart';

class CloudFireStore implements ICloudRepository {
  CategoryDAO categoryDAO = CategoryDAO();
  QuizDAO quizDAO = QuizDAO();
  LanguageDAO languageDAO = LanguageDAO();

  List<Category> categoryList;
  List<Quiz> quizList;
  List<Language> languageList;

  @override
  void loadData() {
    //getAllLanguage();
    convertFutureToList();
    if (quizList == null) {
      print("Is laoding");
    }
    quizDAO.batchPut(quizList);
   //quizDAO.getByKey(1,Quiz());
   // //getAllQuiz();
  }

  void convertFutureToList() async {
    quizList = await getAllQuiz();
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

  Future<List<Quiz>> getAllQuiz() async {
    List<Quiz> quizList = [];
    await FirebaseFirestore.instance
        .collection("quiz")
        .doc('7Gax3pSD2s2WtSihDZX5')
        .get()
        .then((querySnapshot) {
        quizList.add(Quiz.fromDocumentWithID(querySnapshot.data(), querySnapshot.id));
    });

    return quizList;
  }
}
