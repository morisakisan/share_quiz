// Project imports:
import 'package:share_quiz/data/mapper/quiz_mapper.dart';
import '../../domain/models/pagination/pagination.dart';
import '../../domain/models/quiz/quiz.dart';
import '../../domain/models/user_quizzes/user_quizzes.dart';
import '../quiz/quiz_dto.dart';

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
