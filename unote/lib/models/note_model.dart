
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
late  String id;
 late String title;
 late String body;
 late Timestamp creationDate;
  NoteModel({
    required this.id,
    required this.title,
    required this.body,
    required this.creationDate,
  });

  }
