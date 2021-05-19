import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';
import 'package:share_quiz/domain/quiz_new/quiz_new_state.dart';

class QuizNewStateMapper {
  QuizNewStateMapper._();

  static QuizNewState transform(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> data) {
    final list = data.map<Quiz>(
      (e) {
        var json = e.data();
        return Quiz(
            quizId: e.id,
            title: json["title"],
            question: json["question"],
            choices: List.from(json['choices']),
            answer: json["answer"],
            imageUrl: json["image_url"],
            createdAt: json["created_at"]);
      },
    ).toList();

    return QuizNewState(
      list,
    );
  }
}
