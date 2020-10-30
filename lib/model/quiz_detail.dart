import 'package:findwords/model/generic_entity.dart';

class QuizDetail extends GenericEntity {
  final int number;
  final String answer;
  final String question;

  QuizDetail({this.number, this.answer, this.question});

  Map<String, Object> toMap() {
    return {'number': number, 'answer': answer, 'question': question};
  }

  factory QuizDetail.fromDocument(Map<String, Object> doc) {
    QuizDetail quizDetail = new QuizDetail(
        number: doc['number'],
        answer: doc['answer'],
        question: doc['question']);
    return quizDetail;
  }

  factory QuizDetail.fromDocumentList(Map<String, dynamic> doc, int index) {
    QuizDetail quizDetail = new QuizDetail(
        number: int.parse(doc['questions'][index.toString()][0].toString()),
        answer: doc['questions'][index.toString()][1].toString(),
        question: doc['questions'][index.toString()][2].toString()
    );
    return quizDetail;
  }
}
