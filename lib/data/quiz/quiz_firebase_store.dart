import 'package:cloud_firestore/cloud_firestore.dart';

class QuizFirebaseStore {
  CollectionReference<Map<String, dynamic>> _getCollection() {
    return FirebaseFirestore.instance.collection('quiz');
  }

  // Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetchNews() async {
  //   var document = await _getCollection().get();
  //   return document.docs;
  // }

  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetchNews() {
    return _getCollection()
        .orderBy("created_at", descending: true)
        .snapshots()
        .asyncMap((event) => event.docs);
  }

  post(Map<String, dynamic> json) async {
    await _getCollection().doc().set(json);
  }
}
