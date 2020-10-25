class Language {
  final String languageID;
  final String locale;

  Language({this.languageID, this.locale});

  Map<String, Object> toMap() {
    return {'languageID': languageID, 'locale': locale};
  }

  factory Language.fromDocumentWithID(
      Map<String, Object> doc, String documentID) {
    Language language = new Language(
      languageID: documentID,
      locale: doc['locale'],
    );
    return language;
  }

  factory Language.fromMap(Map<String, Object> doc) {
    Language language = new Language(
      languageID: doc['languageID'],
      locale: doc['locale'],
    );
    return language;
  }
}
