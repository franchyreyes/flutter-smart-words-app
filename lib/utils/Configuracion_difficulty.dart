import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

class ConfigurationDifficulty {
  static Future<void> setDifficultySF(Status difficulty) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(kDifficultyGame, difficulty.toString());
  }

  static Future<String> getDifficultySF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kDifficultyGame) ?? Status.easy.toString();
  }
}
