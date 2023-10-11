// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:share_quiz/data/quiz/quiz_dto.dart';

class QuizFirebaseStore {
  static CollectionReference<Map<String, dynamic>> getCollection() {
    return FirebaseFirestore.instance.collection('quiz');
  }

  Stream<List<QuizDto>> fetchList(Object field, bool descending) {
    return getCollection()
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
    return getCollection().doc(quizId).snapshots().map((doc) {
      final json = doc.data();
      if (json == null) {
        return null;
      }
      final dto = QuizDto.fromJson(json);
      return dto.copyWith(docId: doc.id);
    });
  }

  Future<void> post(Map<String, dynamic> json) {
    return getCollection().doc().set(json);
  }
}
