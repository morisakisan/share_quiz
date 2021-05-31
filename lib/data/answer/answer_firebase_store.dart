// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

class AnswerFirebaseStore {
  CollectionReference<Map<String, dynamic>> _getCollection(String docId) {
    return FirebaseFirestore.instance
        .collection('quiz')
        .doc(docId)
        .collection("answer");
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetchAnswers(
      String docId) {
    return _getCollection(docId).get().then((snapshot) => snapshot.docs);
  }

  Future<void> post(String docId, Map<String, dynamic> json) {
    return _getCollection(docId).doc().set(json);
  }

  Future<void> update(
      String quizDocId, String goodDogId, Map<String, dynamic> json) {
    return _getCollection(quizDocId).doc(goodDogId).update(json);
  }

  Future<void> delete(String quizDocId, String goodDogId) {
    return _getCollection(quizDocId).doc(goodDogId).delete();
  }
}
