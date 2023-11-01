// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

class GoodFirebaseStore {
  CollectionReference<Map<String, dynamic>> _getCollection() =>
      FirebaseFirestore.instance.collection('good');

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetchGoods(
          String quizId) =>
      _getCollection().get().then((snapshot) => snapshot.docs);

  Future<void> post(String quizId, Map<String, dynamic> json) =>
      _getCollection().doc().set(json);

  Future<void> update(
          String quizId, String goodDogId, Map<String, dynamic> json) =>
      _getCollection().doc(goodDogId).update(json);

  Future<void> delete(String quizId, String goodDogId) =>
      _getCollection().doc(goodDogId).delete();
}
