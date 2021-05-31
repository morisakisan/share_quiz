// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';

class AnswerFirebaseStore {
  CollectionReference<Map<String, dynamic>> _getCollection(String docId) {
    return QuizFirebaseStore.getCollection().doc(docId).collection("answer");
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetchAnswers(
          String docId) =>
      _getCollection(docId).get().then((snapshot) => snapshot.docs);

  Future<void> post(String docId, Map<String, dynamic> json) =>
      _getCollection(docId).doc().set(json);

}
