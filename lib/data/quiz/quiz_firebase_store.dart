import 'package:cloud_firestore/cloud_firestore.dart';

class QuizFirebaseStore {

  CollectionReference _getCollection() {
    return FirebaseFirestore.instance
        .collection('quiz');
  }

  Future<List<QueryDocumentSnapshot>> fetchNews() async {
    var document = await _getCollection()
        .get();
    return document.docs;
  }

  post(Map<String, dynamic> json) async {
    await _getCollection().doc().set(json);
  }
}
