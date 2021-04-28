import 'package:flutter/material.dart';
import 'package:share_quiz/presentation/page/quiz_post.dart';

class Nav {
  Nav._();

  static const QUIZ_POST = "quiz_post";

  static final routes = <String, WidgetBuilder>{
    QUIZ_POST: (BuildContext context) => QuizPost()
  };
}
