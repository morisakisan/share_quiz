import 'package:share_quiz/domain/quiz/quiz.dart';
import 'package:share_quiz/domain/quiz/quiz_state.dart';

class QuizStateMapper {
  static Future<QuizState> transform() async {
    return QuizState(
      [
        Quiz(
            id: 0,
            title: "簡単な問題",
            question: "1+1は？",
            choices: ["1", "2", "3", "4", "5"],
            answer: 1,
            imageUrl:
                "http://cdn-ak.f.st-hatena.com/images/fotolife/a/awef0001/20140322/20140322213603.jpg"),
      ],
    );
  }
}
