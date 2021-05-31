// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_quiz/data/quiz/quiz_dto.dart';

// Project imports:
import 'package:share_quiz/domain/quiz/quiz.dart';

class QuizNewStateMapper {
  QuizNewStateMapper._();

  static Stream<List<Quiz>> transform(
      Stream<List<QuizDto>> data) {
    return data.map(
      (list) => list.map(
          (dto) {
            return Quiz(
              quizId: dto.docId!,
              title: dto.title,
              question: dto.question,
              choices: dto.choices,
              correctAnswer: dto.correctAnswer,
              imageUrl: dto.imageUrl,
              createdAt: dto.createdAt,
            );
          },
        ).toList(),
    );
  }
}
