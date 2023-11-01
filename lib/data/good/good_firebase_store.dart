// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

import 'good_dto.dart';

class GoodFirebaseStore {
  // CollectionReference<Map<String, dynamic>> _getCollection(String quizId) {
  //   return _getCommentCollectionFromQuiz(
  //       FirebaseFirestore.instance.collection('quiz').doc(quizId));
  // }

  CollectionReference<Map<String, dynamic>> _getGoodCollectionFromQuiz(
      DocumentReference<Map<String, dynamic>> quiz) {
    return quiz.collection('good');
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

  void addGoodInTransaction(
      Transaction transaction,
      DocumentReference<Map<String, dynamic>> quizReference,
      Map<String, dynamic> goodJson) {
    transaction.set(
        _getGoodCollectionFromQuiz(quizReference).doc(), goodJson);
  }
}
