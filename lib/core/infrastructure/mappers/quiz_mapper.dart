// Project imports:
import 'package:share_quiz/core/domain/models/quiz.dart';
import 'package:share_quiz/core/infrastructure/firestore/quiz/quiz_dto.dart';

class QuizMapper {
  QuizMapper._();

  static Quiz transform(QuizDto dto) {
    return Quiz(
        documentId: dto.docId!,
        title: dto.title,
        question: dto.question,
        choices: dto.choices,
        correctAnswer: dto.correctAnswer,
        imageUrls: dto.imageUrl,
        createdAt: dto.createdAt,
        correctAnswerRate: dto.correctAnswerRate,
        answerCount: dto.answerCount,
        goodCount: dto.goodCount);
  }
}
