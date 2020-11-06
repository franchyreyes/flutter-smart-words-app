import 'package:findwords/model/generic_entity.dart';

class QuizDetail extends GenericEntity {
  final int number;
  final String answer;
  final String question;
  final bool completed;

  QuizDetail({this.number, this.answer, this.question,this.completed});

  Map<String, Object> toMap() {
    return {'number': number, 'answer': answer, 'question': question, 'completed': completed};
  }

  factory QuizDetail.fromDocument(Map<String, Object> doc) {
    QuizDetail quizDetail = new QuizDetail(
        number: doc['number'],
        answer: doc['answer'],
        question: doc['question'],
        completed: doc['completed']);
    return quizDetail;
  }

  factory QuizDetail.fromDocumentList(Map<String, dynamic> doc, int index) {
    QuizDetail quizDetail = new QuizDetail(
        number: int.parse(doc['questions'][index.toString()][0].toString()),
        answer: doc['questions'][index.toString()][1].toString(),
        question: doc['questions'][index.toString()][2].toString(),
        completed: false

    );
    return quizDetail;
  }
}
