// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';

class GoodFirebaseStore {
  CollectionReference<Map<String, dynamic>> _getCollection(String docId) =>
      QuizFirebaseStore.getCollection().doc(docId).collection("good");

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetchGoods(
          String docId) =>
      _getCollection(docId).get().then((snapshot) => snapshot.docs);

  Future<void> post(String docId, Map<String, dynamic> json) =>
      _getCollection(docId).doc().set(json);

  Future<void> update(
          String quizDocId, String goodDogId, Map<String, dynamic> json) =>
      _getCollection(quizDocId).doc(goodDogId).update(json);

  Future<void> delete(String quizDocId, String goodDogId) =>
      _getCollection(quizDocId).doc(goodDogId).delete();
}
