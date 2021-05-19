import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';

class QuizNewStateMapper {
  QuizNewStateMapper._();

  static Stream<List<Quiz>> transform(
      Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> data) {
    return data.map(
      (e) {
        return e.map(
          (event) {
            var json = event.data();
            return Quiz(
              quizId: event.id,
              title: json["title"],
              question: json["question"],
              choices: List.from(json['choices']),
              answer: json["answer"],
              imageUrl: json["image_url"],
              createdAt: json["created_at"],
            );
          },
        ).toList();
      },
    );
  }
}
