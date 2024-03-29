enum QuizListOrderBy {
  correctAnswerRateAsc,
  answerCountDesc,
  createdAtDesc,
  goodCountDesc,
}

extension QuizListOrderByExtension on QuizListOrderBy {
  String get name {
    switch (this) {
      case QuizListOrderBy.correctAnswerRateAsc:
        return 'correct_answer_rate';
      case QuizListOrderBy.answerCountDesc:
        return 'answer_count';
      case QuizListOrderBy.createdAtDesc:
        return 'created_at';
      case QuizListOrderBy.goodCountDesc:
        return 'good_count';
    }
  }

  bool get desc {
    switch (this) {
      case QuizListOrderBy.correctAnswerRateAsc:
        return false;
      case QuizListOrderBy.answerCountDesc:
        return true;
      case QuizListOrderBy.createdAtDesc:
        return true;
      case QuizListOrderBy.goodCountDesc:
        return true;
    }
  }
}
