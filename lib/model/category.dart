import 'package:findwords/model/generic_entity.dart';
import 'package:flutter/material.dart';


class Category extends GenericEntity{
   final String documentID;
   String name;
   final String img;
   final int code;

   @override
   int  id;

   Category.withID({
     this.id,
     this.documentID,
     this.name,
     this.img,
     this.code
   });

   Category({
     this.documentID,
     this.name,
     this.img,
     this.code
   });

   Map<String, Object> toMap() {
     return {
       'documentID': documentID,
       'name': name,
       'img': img,
       'code': code
     };
   }

   factory Category.fromDocumentWithID(Map<String, Object> doc, String documentID) {
     Category category = new Category(
       documentID: documentID,
       name: doc['name'],
       img: doc['img'],
       code: doc['code'],
     );
     return category;
   }

   Category fromMapGeneric (Map<String, Object> doc, int id) {
     Category category = new Category.withID(
       id: id,
       documentID: doc['documentID'],
       name: doc['name'],
       img: doc['img'],
       code: doc['code'],
     );
     return category;
   }

   factory Category.fromMap(Map<String, Object> doc) {
     Category category = new Category(
       documentID: doc['documentID'],
       name: doc['name'],
       img: doc['img'],
       code: doc['code'],
     );
     return category;
   }
}