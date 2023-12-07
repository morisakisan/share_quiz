// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'good_dto.dart';

class GoodFirebaseStore {
  CollectionReference<Map<String, dynamic>> _getCollection(String quizId) {
    return _getGoodCollectionFromQuiz(
        FirebaseFirestore.instance.collection('quiz').doc(quizId));
  }

  CollectionReference<Map<String, dynamic>> _getGoodCollectionFromQuiz(
      DocumentReference<Map<String, dynamic>> quiz) {
    return quiz.collection('good');
  }

  Future<void> deleteAllDocuments(String quizId) async {
    CollectionReference<Map<String, dynamic>> collection = _getCollection(quizId);
    var snapshots = await collection.get();

    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  Future<List<GoodDto>> fetchGood(
      DocumentReference<Map<String, dynamic>> quiz) {
    return _getGoodCollectionFromQuiz(quiz)
        .get()
        .then<List<GoodDto>>((query) => query.docs.map((e) {
              var json = e.data();
              return GoodDto.fromJson(json);
            }).toList());
  }

  Future<void> addGoodInTransaction(
      Transaction transaction,
      DocumentReference<Map<String, dynamic>> quizReference,
      Map<String, dynamic> goodJson) async {
    transaction.set(_getGoodCollectionFromQuiz(quizReference).doc(), goodJson);
  }

  Future<void> deleteGoodInTransaction(
      Transaction transaction,
      DocumentReference<Map<String, dynamic>> quizReference,
      String uid) async {
    final goodCollection = _getGoodCollectionFromQuiz(quizReference);
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await goodCollection.where('uid', isEqualTo: uid).limit(1).get();
    if (querySnapshot.docs.isNotEmpty) {
      transaction.delete(querySnapshot.docs.first.reference);
    }
  }

  Stream<GoodDto?> fetchMyGood(String quizId, String userId) {
    return _getCollection(quizId)
        .where("uid", isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.isNotEmpty
            ? GoodDto.fromJson(snapshot.docs.first.data())
            : null);
  }
}
