// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:share_quiz/data/quiz/quiz_dto.dart';

class QuizFirebaseStore {
  static CollectionReference<Map<String, dynamic>> _getCollection() {
    return FirebaseFirestore.instance.collection('quiz');
  }

  Stream<List<QuizDto>> fetchList(Object field, bool descending) {
    return _getCollection()
        .orderBy(field, descending: descending)
        .limit(100)
        .snapshots()
        .map(
          (event) => event.docs.map(
            (e) {
              return QuizDto.fromJson(e.data()).copyWith(docId: e.id);
            },
          ).toList(),
        );
  }

  Stream<QuizDto?> fetchWhereByQuizId(String quizId) {
    return _getCollection().doc(quizId).snapshots().map((doc) {
      final json = doc.data();
      if (json == null) {
        return null;
      }
      final dto = QuizDto.fromJson(json);
      return dto.copyWith(docId: doc.id);
    });
  }

  Future<void> post(Map<String, dynamic> json) {
    return _getCollection().doc().set(json);
  }

  DocumentReference<Map<String, dynamic>> getDoc(String quizDocId) {
    return _getCollection().doc(quizDocId);
  }

  void updateQuizInTransaction(Transaction transaction,
      DocumentReference quizReference, double rate, int answerCount) {
    transaction.update(quizReference, {
      "correct_answer_rate": rate,
      "answer_count": answerCount,
    });
  }

  Future<List<QuizDto>> fetchMyQuiz(String uid) {
    return _getCollection()
        .where("quiz_id", isEqualTo: uid)
        .orderBy("created_at")
        .get()
        .then<List<QuizDto>>((query) => query.docs.map((e) {
              var json = e.data();
              json["quiz_id"] = e.reference.id;
              return QuizDto.fromJson(json);
            }).toList());
  }
}
