/* Firebase and Sembast  Table Name */
import 'package:shared_preferences/shared_preferences.dart';

const String kTableLanguageName = "language";
const String kTableCategoryName = "category";
const String kTableQuizName = "quiz";

const String kDifficultyGame = "kDifficultyGame";
const String kConfigurationLoading = "configurationLoading";
const String kConfigurationLoadingFirebase = "configurationLoadingFirebase";
const String kConfigurationDialogHelp = "configurationDialogHelp";


/*fonts*/
const fontRegular = 'Regular';
const fontMedium = 'Medium';
const fontSemibold = 'Semibold';
const fontBold = 'Bold';
/* font sizes*/
const textSizeSmall = 12.0;
const textSizeSMedium = 14.0;
const textSizeMedium = 16.0;
const textSizeLargeMedium = 18.0;
const textSizeNormal = 20.0;
const textSizeLarge = 24.0;
const textSizeXLarge = 28.0;
const textSizeXXLarge = 30.0;

const kAllowTotalFail = 3;
const kUnderScore = '_';
const kAllowFail = 1;
const STATUS_EASY = 'Status.easy';
const STATUS_MEDIUM = 'Status.medium';
const STATUS_HARD = 'Status.hard';



enum Status { easy, medium, hard }

void clearAllSharePreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var arrayOfKey = [kDifficultyGame,kConfigurationLoading,kConfigurationLoadingFirebase,kConfigurationDialogHelp];
  for (var key in arrayOfKey) {
    if (preferences.containsKey(key)) {
      print(key);
      await preferences.remove(key);
    }
  }
}
