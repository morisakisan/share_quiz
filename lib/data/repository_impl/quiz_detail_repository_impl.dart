// Dart imports:
import 'dart:async';

// Package imports:
import 'package:rxdart/rxdart.dart';
import 'package:share_quiz/data/good/good_firebase_store.dart';

// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import '../../domain/models/quiz_detail/quiz_detail.dart';
import '../../domain/models/user_quiz_interaction/user_quiz_interaction.dart';
import '../../domain/repository/quiz_detail_repository.dart';
import '../answer/answer_firebase_store.dart';
import '../mapper/quiz_mapper.dart';
import '../quiz/quiz_firebase_store.dart';

class QuizDetailRepositoryImpl extends QuizDetailRepository {
  final _quizDataStore = QuizFirebaseStore();
  final _answerDataStore = AnswerFirebaseStore();
  final _userDataStore = FirebaseAuthStore();
  final _goodDataStore = GoodFirebaseStore();

  @override
  Stream<QuizDetail> fetch(String quizId) {
    final quiz = _quizDataStore
        .fetchWhereByQuizId(quizId)
        .asyncMap((quizDto) => QuizMapper.transform(quizDto!));
    final userStream = _userDataStore
        .listenToUserChanges()
        .asyncExpand<UserQuizInteraction>((user) {
      if (user != null) {
        final userId = user.uid;
        final goodStream = _goodDataStore.fetchMyGood(quizId, userId);
        final answerStream = _answerDataStore.fetchMyAnswers(quizId, user.uid);

        return CombineLatestStream.combine2(
          goodStream,
          answerStream,
          (good, answer) => UserQuizInteraction(
              isLogin: true,
              selectAnswer: answer?.answer,
              hasGood: good != null)
        );
      } else {
        return Stream.value(const UserQuizInteraction(
            isLogin: false, selectAnswer: null, hasGood: false));
      }
    });

    return CombineLatestStream.combine2(
        quiz,
        userStream,
        (quiz, userQuizInteraction) =>
            QuizDetail(quiz: quiz, userQuizInteraction: userQuizInteraction));
  }
}
