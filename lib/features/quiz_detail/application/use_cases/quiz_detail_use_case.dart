// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/features/quiz_detail/domain/models/quiz_detail.dart';
import 'package:share_quiz/features/quiz_detail/domain/repositories/quiz_detail_repository.dart';

class QuizDetailUseCase extends StreamNotifier<QuizDetail> {
  final QuizDetailRepository _repository;
  final String _quizId;

  QuizDetailUseCase(this._repository, this._quizId) : super();

  @override
  Stream<QuizDetail> build() {
    return _repository.fetch(_quizId);
  }
}
