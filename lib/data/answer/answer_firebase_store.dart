// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:share_quiz/data/answer/answer_dto.dart';

class AnswerFirebaseStore {
  CollectionReference<Map<String, dynamic>> _getCollection(String quizId) {
    return _getAnswerCollectionFromQuiz(
        FirebaseFirestore.instance.collection('quiz').doc(quizId));
  }

  CollectionReference<Map<String, dynamic>> _getAnswerCollectionFromQuiz(
      DocumentReference<Map<String, dynamic>> quiz) {
    return quiz.collection('answer');
  }

  Future<List<AnswerDto>> fetchAnswers(
      DocumentReference<Map<String, dynamic>> quiz) {
    return _getAnswerCollectionFromQuiz(quiz)
        .get()
        .then<List<AnswerDto>>((query) => query.docs.map((e) {
              var json = e.data();
              json["quiz_id"] = e.reference.id;
              return AnswerDto.fromJson(json);
            }).toList());
  }

  Stream<AnswerDto?> fetchMyAnswers(String quizId, String userId) {
    return _getCollection(quizId)
        .where("quiz_id", isEqualTo: quizId)
        .where("uid", isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      final list = snapshot.docs
          .map((e) => AnswerDto.fromJson(e.data()).copyWith(id: e.id))
          .toList();
      if (list.isEmpty) {
        return null;
      } else {
        return list.first;
      }
    });
  }

  void addAnswerInTransaction(
      Transaction transaction,
      DocumentReference<Map<String, dynamic>> quizReference,
      Map<String, dynamic> answerJson) {
    transaction.set(_getAnswerCollectionFromQuiz(quizReference).doc(), answerJson);
  }
}
