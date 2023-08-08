import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:unote/models/note_model.dart';
import 'package:uuid/uuid.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userCollection = 'users';
  final String noteCollection = 'notes';
  Future<void> addNote(String uid, String title, String body) async {
    try {
      var uuid = Uuid().v4();
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(uuid)
          .set({
            "id": uuid,
        "title": title,
        "body": body,
        "creationDate": Timestamp.now(),
          });
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> updateNote(
      String uid, String title, String body, String id) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(id)
          .update({
        "title": title,
        "body": body,
        "creationDate": Timestamp.now(),
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> delete(String uid, String id) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(id)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
   Stream<List<NoteModel>> noteStream(String uid) {
    return _firestore
        .collection(userCollection)
        .doc(uid)
        .collection(noteCollection)
        .orderBy("creationDate", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<NoteModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(NoteModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
