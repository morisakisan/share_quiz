// Dart imports:
import 'dart:async';

// Project imports:
import 'package:share_quiz/data/answer/answer_firebase_store.dart';
import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/data/user/user_firebase_store.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';
import 'package:share_quiz/domain/quiz_answer_data/quiz_answer_data.dart';

class QuizAnswerDataRepository {
  final _quizDataStore = QuizFirebaseStore();
  final _answerDataStore = AnswerFirebaseStore();
  final _userDataStore = UserFirebaseStore();

  Future<QuizAnswerData> fetch(String quizId) async {
    final quizDto = await _quizDataStore.fetchWhereByQuizId(quizId);
    final user = await _userDataStore.gerCurrentUser();
    final answer = await _answerDataStore.fetchMyAnswers(quizId, user!.uid);
    final quiz = Quiz(
      documentId: quizDto!.docId!,
      title: quizDto.title,
      question: quizDto.question,
      choices: quizDto.choices,
      correctAnswer: quizDto.correctAnswer,
      imageUrl: quizDto.imageUrl,
      createdAt: quizDto.createdAt,
    );
    return QuizAnswerData(quiz: quiz, select_anser: answer.select);
  }

}
