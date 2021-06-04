// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_quiz/data/quiz/quiz_dto.dart';

class QuizFirebaseStore {
  static CollectionReference<Map<String, dynamic>> getCollection() {
    return FirebaseFirestore.instance.collection('quiz');
  }

  Stream<List<QuizDto>> fetchOrderByAnswerCountDesc() {
    return getCollection()
        .orderBy("answer_count", descending: true)
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

  Stream<List<QuizDto>> fetchOrderByCreatedAtDesc() {
    return getCollection()
        .orderBy("created_at", descending: true)
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

  Future<QuizDto?> fetchWhereByQuizId(String quizId) async {
    final doc = await getCollection().doc(quizId).get();
    final json = doc.data();
    if (json == null) {
      return null;
    }

    final dto = QuizDto.fromJson(json);
    return dto.copyWith(docId: doc.id);
  }

  Future<void> post(Map<String, dynamic> json) {
    return getCollection().doc().set(json);
  }
}
