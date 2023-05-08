import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:googlekeep/model/MyNoteModel.dart';
import 'db.dart';

class FireDB {
  //CREATE,READ,UPDATE,DELETE
  final FirebaseAuth _auth = FirebaseAuth.instance;

  createNewNoteFirestore(Note note ) async {
    final User? current_user = _auth.currentUser;
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(current_user!.email)
        .collection("usernotes")
        .doc(note.uniqueID)
        .set({
      "Title": note.title,
      "content": note.content,
      "uniqueID" : note.uniqueID,
      "date": note.createdTime,
      // "Title": "New test title",
      //  "content": "test notes",
      //  "date": DateTime.now(),
    }).then((_) {
      print("DATA ADDED SUCCESSFULLY");
    });
  }

  getAllStoredNotes() async {
    final User? current_user = _auth.currentUser;
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(current_user!.email)
        .collection("usernotes")
        .orderBy("date")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        Map note = result.data();
        NotesDatabse.instance.InsertEntry(Note(
            title: note["Title"],
            uniqueID: note["uniqueID"],
            content: note["content"],
            createdTime: note["date"],
            pin: false,
            isArchived: false
            )); //Add Notes In Database
      });
    });
  }

  updateNoteFirestore(Note note) async {
    final User? current_user = _auth.currentUser;
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(current_user!.email)
        .collection("usernotes")
        .doc(note.uniqueID.toString())
        .update({"Title": note.title.toString(), "content": note.content}).then(
            (_) {
      print("DATA ADDED SUCCESFULLY");
    });
  }

  deleteNoteFirestore(Note note) async {
    final User? current_user = _auth.currentUser;
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(current_user!.email.toString())
        .collection("usernotes")
        .doc(note.uniqueID.toString())
        .delete()
        .then((_) {
      print("DATA DELETED SUCCESS FULLY");
    });
  }
}
