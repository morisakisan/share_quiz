import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';
import 'package:share_quiz/domain/quiz/quiz_state.dart';

class QuizStateMapper {
  QuizStateMapper._();

  static Future<QuizState> transform(List<QueryDocumentSnapshot> data) async {
    final list = data.map<Quiz>((e) {
      var json = e.data();
      List<String> choices = List.from(json['choices']);
      return Quiz(
        title: json["title"],
        question : json["question"],
        choices: choices,
        answer: json["answer"],
      );
    }).toList();

    return QuizState(
      list,
    );
  }
}
