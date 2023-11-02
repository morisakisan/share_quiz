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

  void updateQuizGoodCountInTransaction(Transaction transaction,
      DocumentReference quizReference, int goodCount) {
    transaction.update(quizReference, {
      "good_count": goodCount,
    });
  }

  DocumentSnapshot? lastDocument;

  Future<List<QuizDto>> fetchMyQuiz(String uid) {
    const limit = 10;
    var query = _getCollection()
        .where("uid", isEqualTo: uid)
        .orderBy("created_at", descending: true)
        .limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument!);
    }

    return query.get().then<List<QuizDto>>((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        lastDocument = querySnapshot.docs.last;
      }

      return querySnapshot.docs.map((e) {
        var json = e.data();
        final dto = QuizDto.fromJson(json);
        return dto.copyWith(docId: e.id);
      }).toList();
    });
  }
}
