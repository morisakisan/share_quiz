// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/data/firestore/answer/answer_dto.dart';
import 'package:share_quiz/data/firestore/answer/answer_firebase_store.dart';
import 'package:share_quiz/data/firestore/firestore_transaction/fire_store_transaction_store.dart';
import 'package:share_quiz/data/firestore/quiz/quiz_dto.dart';
import 'package:share_quiz/data/firestore/quiz/quiz_firebase_store.dart';
import '../../domain/repository/quiz_answer_post_repository.dart';

class QuizAnswerPostRepositoryImpl extends QuizAnswerPostRepository {
  final _firebaseAuthStore = FirebaseAuthStore();
  final _answerFirebaseStore = AnswerFirebaseStore();
  final _quizFirebaseStore = QuizFirebaseStore();
  final _transactionStore = FireStoreTransactionStore();

  @override
  Future<void> post(String quizDocId, int select) {
    return _transactionStore.runTransaction(
      (transaction) async {
        final quizDoc = _quizFirebaseStore.getDoc(quizDocId);
        final updateQuiz = await transaction.get(quizDoc);
        final updateQuizDto = QuizDto.fromJson(updateQuiz.data()!);
        var isCorrect = updateQuizDto.correctAnswer == select;
        final answers = await _answerFirebaseStore.fetchAnswers(quizDoc);
        final answerCount = answers.length + 1;
        var correctAnswerCount = 0;
        for (var dto in answers) {
          if (dto.answer == updateQuizDto.correctAnswer) {
            correctAnswerCount++;
          }
        }
        if (isCorrect) {
          correctAnswerCount++;
        }
        final rate = correctAnswerCount / answerCount;
        var user = _firebaseAuthStore.getCurrentUser();
        var answerJson = AnswerDto(
                answer: select,
                userId: user!.uid,
                isCorrect: isCorrect,
                createdAt: null)
            .toJson();
        _answerFirebaseStore.addAnswerInTransaction(
            transaction, updateQuiz.reference, answerJson);
        _quizFirebaseStore.updateQuizInTransaction(
            transaction, updateQuiz.reference, rate, answerCount);
      },
    );
  }
}
