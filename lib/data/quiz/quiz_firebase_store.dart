// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizFirebaseStore {
  CollectionReference<Map<String, dynamic>> _getCollection() {
    return FirebaseFirestore.instance.collection('quiz');
  }

  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetchNews() {
    return _getCollection()
        .orderBy("created_at", descending: true)
        .limit(100)
        .snapshots()
        .map(
          (event) => event.docs,
        );
  }

  Future<void> post(Map<String, dynamic> json) {
    return _getCollection().doc().set(json);
  }
}
