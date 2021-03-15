import 'dart:io';

class AdManager {

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6141393988827316~4928181443";
    } else if (Platform.isIOS) {
      return "ca-app-pub-6141393988827316~4928181443";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6141393988827316/3371557194";
    } else if (Platform.isIOS) {
      return "ca-app-pub-6141393988827316/3371557194";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

}