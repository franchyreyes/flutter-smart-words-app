import 'package:findwords/db/quiz_repository.dart';
import 'package:findwords/utils/constant.dart';
import 'package:sembast/sembast.dart';


class QuizDAO extends QuizRepository{

  @override
  StoreRef<int, Map<String,dynamic>> store = intMapStoreFactory.store(kTableQuizName);

}