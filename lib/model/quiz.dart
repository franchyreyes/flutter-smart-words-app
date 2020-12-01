import 'package:findwords/model/generic_entity.dart';
import 'package:findwords/model/quiz_detail.dart';

class Quiz extends GenericEntity {
  final String documentID;
  final String categoryID;
  final String languageID;
  final List<QuizDetail> quizDetailsList;

  @override
  int id;

  Quiz(
      {this.documentID,
      this.categoryID,
      this.languageID,
      this.quizDetailsList});

  Quiz.withID(
      {this.id,
      this.documentID,
      this.categoryID,
      this.languageID,
      this.quizDetailsList});

  Map<String, Object> toMap() {
    return {
      'documentID': documentID,
      'categoryID': categoryID,
      'languageID': languageID,
      'questions': [
        for (int i = 0; i < quizDetailsList.length; i++)
          quizDetailsList[i].toMap()
      ]
    };
  }

  Quiz fromMapGeneric(Map<String, dynamic> doc, int id) {
    List<QuizDetail> quizDetailsListMock = List<QuizDetail>();

    for (int i = 0; i < doc['questions'].length; i++) {
      quizDetailsListMock.add(QuizDetail.fromSembast(doc, i));
    }

    Quiz quiz = new Quiz.withID(
        id: id,
        documentID: doc['documentID'].toString(),
        categoryID: doc['categoryID'].toString(),
        languageID: doc['languageID'].toString(),
        quizDetailsList: quizDetailsListMock);
    return quiz;
  }

  factory Quiz.fromDocumentWithID(Map<String, dynamic> doc, String documentID) {
    List<QuizDetail> quizDetailsListMock = List<QuizDetail>();

    for (int i = 0; i < doc['questions'].length; i++) {
      quizDetailsListMock.add(QuizDetail.fromDocumentList(doc, i));
    }

    Quiz quiz = Quiz(
        documentID: documentID,
        categoryID: doc['categoryID'].toString(),
        languageID: doc['languageID'].toString(),
        quizDetailsList: quizDetailsListMock);
    return quiz;
  }
}
