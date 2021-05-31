// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:share_quiz/presentation/page/quiz_answer.dart';
import 'package:share_quiz/presentation/page/quiz_post.dart';
import 'package:share_quiz/presentation/page/setting.dart';

class Nav {
  Nav._();

  static const QUIZ_POST = "quiz_post";
  static const QUIZ_ANSWER = "quiz_answer";
  static const SETTING = "setting";

  static final routes = <String, WidgetBuilder>{
    QUIZ_POST: (BuildContext context) => QuizPost(),
    QUIZ_ANSWER: (BuildContext context) => QuizAnswer(),
    SETTING: (BuildContext context) => Setting()
  };
}
