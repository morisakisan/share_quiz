// Project imports:
import 'package:share_quiz/core/domain/models/quiz.dart';
import 'package:share_quiz/core/infrastructure/firestore/quiz/quiz_dto.dart';
import 'package:share_quiz/core/infrastructure/mappers/quiz_mapper.dart';
import 'package:share_quiz/core/domain/models/pagination.dart';
import 'package:share_quiz/features/profile/domain/models/user_quizzes.dart';

class UserQuizzesMapper {
  UserQuizzesMapper._();  // private constructor

  static List<Quiz> transformList(List<QuizDto> dtoList) {
    return dtoList.map((dto) => QuizMapper.transform(dto)).toList();
  }

  static UserQuizzes transformToUserQuizzes(List<QuizDto> dtoList) {
    return UserQuizzes(
        quizzes: transformList(dtoList),
        pagination: Pagination(hasMore: dtoList.length == 10)
    );
  }
}
