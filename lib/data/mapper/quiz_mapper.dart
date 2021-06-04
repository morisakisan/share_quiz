// Project imports:
import 'package:share_quiz/data/quiz/quiz_dto.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';

class QuizMapper {
  QuizMapper._();

  static Quiz transform(QuizDto dto) {
    return Quiz(
      documentId: dto.docId!,
      title: dto.title,
      question: dto.question,
      choices: dto.choices,
      correctAnswer: dto.correctAnswer,
      imageUrl: dto.imageUrl,
      createdAt: dto.createdAt,
      car: dto.car,
      answerCount: dto.answerCount
    );
  }
}
