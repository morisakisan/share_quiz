// Dart imports:
import 'dart:async';

// Package imports:
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import '../../domain/models/quiz_detail/quiz_detail.dart';
import '../../domain/repository/quiz_detail_repository.dart';
import '../answer/answer_firebase_store.dart';
import '../mapper/quiz_mapper.dart';
import '../quiz/quiz_firebase_store.dart';
import '../user/user_firebase_store.dart';

class QuizDetailRepositoryImpl extends QuizDetailRepository {
  final _quizDataStore = QuizFirebaseStore();
  final _answerDataStore = AnswerFirebaseStore();
  final _userDataStore = UserFirebaseStore();

  @override
  Stream<QuizDetail> fetch(String quizId) {
    final quiz = _quizDataStore
        .fetchWhereByQuizId(quizId)
        .asyncMap((quizDto) => QuizMapper.transform(quizDto!));
    final userStream = _userDataStore
        .listenToUserChanges()
        .asyncExpand<Tuple2<bool, int?>>((user) {
      if (user != null) {
        return _answerDataStore
            .fetchMyAnswers(quizId, user.uid)
            .map((event) => Tuple2(true, event?.answer));
      } else {
        return Stream.value(Tuple2(false, null));
      }
    });
    return CombineLatestStream.combine2(
        quiz,
        userStream,
        (quiz, answer) => QuizDetail(
            quiz: quiz,
            select_anser: answer.item2 ?? null,
            isLogin: answer.item1));
  }
}
