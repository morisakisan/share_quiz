// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../models/quiz_detail/quiz_detail.dart';
import '../repository/quiz_detail_repository.dart';

class QuizDetailUseCase extends StreamNotifier<QuizDetail> {
  final QuizDetailRepository _repository;
  final String _quizId;

  QuizDetailUseCase(this._repository, this._quizId) : super();

  @override
  Stream<QuizDetail> build() {
    return _repository.fetch(_quizId);
  }
}
