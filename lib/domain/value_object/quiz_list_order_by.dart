enum QuizListOrderBy {
  CORRECT_ANSWER_RATE_ASC,
  ANSWER_COUNT_DESC,
  CREATED_AT_DESC
}

extension QuizListOrderByExtension on QuizListOrderBy {
  String get name {
    switch (this) {
      case QuizListOrderBy.CORRECT_ANSWER_RATE_ASC:
        return 'correct_answer_rate';
      case QuizListOrderBy.ANSWER_COUNT_DESC:
        return 'answer_count';
      case QuizListOrderBy.CREATED_AT_DESC:
        return 'created_at';
    }
  }

  bool get desc {
    switch (this) {
      case QuizListOrderBy.CORRECT_ANSWER_RATE_ASC:
        return false;
      case QuizListOrderBy.ANSWER_COUNT_DESC:
        return true;
      case QuizListOrderBy.CREATED_AT_DESC:
        return true;
    }
  }
}
