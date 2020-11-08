import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

enum Status { easy, medium, hard }

class ConfigurationDifficulty {

  Future<void> setDifficultySF(Status difficulty) async {
    switch (difficulty) {
      case Status.easy:
        {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(kDifficultyGame, difficulty.toString());
        }
        break;
      case Status.medium:
        {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(kDifficultyGame, difficulty.toString());
        }
        break;
      case Status.hard:
        {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(kDifficultyGame, difficulty.toString());
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }


  Future<String> getDifficultySF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kDifficultyGame).toString() ?? 'Status.none';

  }

}
