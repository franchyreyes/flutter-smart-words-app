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

class ConfigurationLoading {
  static Future<void> setLoadingSF({bool value = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(kConfigurationLoading, value);
  }

  static Future<bool> getLoadingSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kConfigurationLoading) ?? false;
  }
}

class ConfigurationLoadingFirebase {
  static Future<void> setLoadingSF({String value = ""}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(kConfigurationLoadingFirebase, value);
  }

  static Future<String> getLoadingSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kConfigurationLoadingFirebase) ?? "";
  }
}

