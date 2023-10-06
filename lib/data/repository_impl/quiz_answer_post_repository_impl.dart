// Project imports:
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repository/quiz_answer_post_repository.dart';
import '../answer/answer_dto.dart';
import '../answer/answer_firebase_store.dart';
import '../quiz/quiz_dto.dart';
import '../quiz/quiz_firebase_store.dart';
import '../user/user_firebase_store.dart';

class QuizAnswerPostRepositoryImpl extends QuizAnswerPostRepository {
  final answerDatastore = AnswerFirebaseStore();
  final userDatastore = UserFirebaseStore();

  @override
  Future<void> post(String quizDocId, int select) {
    return FirebaseFirestore.instance.runTransaction(
      (transaction) async {
        final updateQuiz = await transaction
            .get(QuizFirebaseStore.getCollection().doc(quizDocId));
        final updateQuizDto = QuizDto.fromJson(updateQuiz.data()!);

        final answers = (await updateQuiz.reference.collection("answer").get())
            .docs
            .map((e) => AnswerDto.fromJson(e.data()))
            .toList();
        var user = await userDatastore.getCurrentUser();
        var isCorrect = updateQuizDto.correctAnswer == select;
        var answerJson = {
          "quiz_id": quizDocId,
          "answer": select,
          "user_id": user!.uid,
          "is_correct": isCorrect,
          "created_at": FieldValue.serverTimestamp()
        };
        final answerCount = answers.length + 1;
        var correctAnswerCount = 0;
        answers.forEach(
          (dto) {
            if (dto.answer == updateQuizDto.correctAnswer) {
              correctAnswerCount++;
            }
          },
        );
        if (isCorrect) {
          correctAnswerCount++;
        }
        final rate = correctAnswerCount / answerCount;
        answerJson["created_at"] = FieldValue.serverTimestamp();
        transaction.set(
            updateQuiz.reference.collection("answer").doc(), answerJson);
        updateQuiz.reference.update(
          {
            "correct_answer_rate": rate,
            "answer_count": answerCount,
          },
        );
      },
    );
  }
}
