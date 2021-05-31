// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_quiz/data/quiz/quiz_dto.dart';

class QuizFirebaseStore {
  static CollectionReference<Map<String, dynamic>> getCollection() {
    return FirebaseFirestore.instance.collection('quiz');
  }

  Stream<List<QuizDto>> fetchOrderByCreatedAtDesc() {
    return getCollection()
        .orderBy("created_at", descending: true)
        .limit(100)
        .snapshots()
        .map(
          (event) =>
          event.docs
              .map(
                (e) {
                  print(e.data());
                  return QuizDto.fromJson(e.data()).copyWith(docId: e.id);
                },
          )
              .toList(),
    );
  }

  Future<QuizDto?> fetchWhereByQuizId(String quizId) {
    return getCollection().doc(quizId).get().then((e) {
      final json = e.data();
      if(json == null) {
        return null;
      }
      QuizDto.fromJson(json).copyWith(docId: e.id);
    });
  }

  Future<void> post(Map<String, dynamic> json) {
    return getCollection().doc().set(json);
  }
}
