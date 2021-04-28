import 'package:share_quiz/domain/quiz/quiz.dart';
import 'package:share_quiz/domain/quiz/quiz_state.dart';

class QuizStateMapper {
  static Future<QuizState> transform() async {
    return QuizState([
      Quiz(
          id: 0,
          title: "簡単な問題",
          question: "1+1は？",
          choices: ["1", "2", "3", "4", "5"],
          answer: 1,
          imageUrl:
              "https://lh3.googleusercontent.com/proxy/hcc-ScidcZZFskLfD6SvpKAr9STvJ9eGu5Nt4lx4XOrn5s1hZ0uTRs87fPeHxF24Asew-SbYbE8mnIaU6wNtSoFS1etF5WINNzDmLyt7oaVpfnv-_VVm1iEFFw")
    ]);
  }
}
