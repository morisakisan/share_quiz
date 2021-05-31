// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_quiz/data/answer/answer_dto.dart';
import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';

class AnswerFirebaseStore {
  CollectionReference<Map<String, dynamic>> _getCollection(String docId) {
    return QuizFirebaseStore.getCollection().doc(docId).collection("answer");
  }

  Future<List<AnswerDto>> fetchAnswers(String docId) =>
      _getCollection(docId).get().then(
            (snapshot) => snapshot.docs
                .map(
                  (e) => AnswerDto.fromJson(e.data()).copyWith(id: e.id),
                )
                .toList(),
          );

  Future<AnswerDto?> fetchMyAnswers(String docId, String userId) =>
      _getCollection(docId)
          .where("userId", isEqualTo: userId)
          .get()
          .then((snapshot) {
        final list = snapshot.docs
            .map(
              (e) => AnswerDto.fromJson(e.data()).copyWith(id: e.id),
            )
            .toList();
        if(list.isEmpty) {
          return null;
        }

        return list.first;
      });

  Future<void> post(String docId, AnswerDto dto) =>
      _getCollection(docId).doc().set(dto.toJson());
}
