// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:share_quiz/data/answer/answer_dto.dart';

class AnswerFirebaseStore {
  CollectionReference<Map<String, dynamic>> _getCollection(String quizId) {
    return FirebaseFirestore.instance
        .collection('quiz')
        .doc(quizId)
        .collection('answer');
  }

  Future<List<AnswerDto>> fetchAnswers(String quizId) =>
      _getCollection(quizId).get().then(
            (snapshot) => snapshot.docs
                .map(
                  (e) => AnswerDto.fromJson(e.data()).copyWith(id: e.id),
                )
                .toList(),
          );

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
}
