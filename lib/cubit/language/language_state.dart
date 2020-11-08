part of 'language_cubit.dart';


abstract class LanguageState{
}

class LanguageInitialState extends LanguageState {

}


class LanguageLoadedState extends LanguageState {
  final List<Language> languageList;

  LanguageLoadedState(this.languageList);


  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LanguageLoadedState && o.languageList == languageList;
  }

  @override
  int get hashCode => languageList.hashCode;
}

class LanguageErrorState extends LanguageState {
  final String message;
  LanguageErrorState(this.message);


  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LanguageErrorState && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;

}

class LanguageLoadingState extends LanguageState {


}