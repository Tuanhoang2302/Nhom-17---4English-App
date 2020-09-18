import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  CollectionReference wordCollection;

  DatabaseService(String name) {
    wordCollection = FirebaseFirestore.instance.collection(name);
  }

  Future addNewWord(String word, String phonetics) async {
    return await wordCollection
        .add({
          'word': word,
          'phonetics': phonetics,
        }).then((value) => print("user_add"))
        .catchError((Error) => print(Error));
  }
}