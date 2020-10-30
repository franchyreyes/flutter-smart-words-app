import 'package:findwords/model/generic_entity.dart';

class Category extends GenericEntity{
   final String documentID;
   final String name;
   @override
   int  id;

   Category.withID({
     this.id,
     this.documentID,
     this.name
   });

   Category({
     this.documentID,
     this.name
   });

   Map<String, Object> toMap() {
     return {
       'documentID': documentID,
       'name': name
     };
   }

   factory Category.fromDocumentWithID(Map<String, Object> doc, String documentID) {
     Category category = new Category(
       documentID: documentID,
       name: doc['name'],
     );
     return category;
   }

   Category fromMapGeneric (Map<String, Object> doc, int id) {
     Category category = new Category.withID(
       id: id,
       documentID: doc['documentID'],
       name: doc['name'],
     );
     return category;
   }

   factory Category.fromMap(Map<String, Object> doc) {
     Category category = new Category(
       documentID: doc['documentID'],
       name: doc['name'],
     );
     return category;
   }
}