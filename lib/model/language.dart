import 'package:findwords/model/generic_entity.dart';

class Language extends GenericEntity {
  final String documentID;
  final String locale;
  @override
  int id;

  Language.withID({this.id, this.documentID, this.locale});

  Language({this.documentID, this.locale});

  Map<String, Object> toMap() {
    return {'documentID': documentID, 'locale': locale};
  }

  factory Language.fromDocumentWithID(
      Map<String, Object> doc, String documentID) {
    Language language = new Language(
      documentID: documentID,
      locale: doc['locale'],
    );
    return language;
  }

  Language fromMapGeneric(Map<String, Object> doc, int id) {
    Language language = new Language.withID(
      id: id,
      documentID: doc['documentID'],
      locale: doc['locale'],
    );
    return language;
  }

  factory Language.fromMap(
    Map<String, Object> doc,
  ) {
    Language language = new Language(
      documentID: doc['documentID'],
      locale: doc['locale'],
    );
    return language;
  }
}
