import 'package:flutter/material.dart';
import 'package:share_quiz/presentation/page/quiz_detail.dart';
import 'package:share_quiz/presentation/page/quiz_post.dart';

class Nav {
  Nav._();

  static const QUIZ_POST = "quiz_post";
  static const QUIZ_DETAIL = "quiz_detail";

  static final routes = <String, WidgetBuilder>{
    QUIZ_POST: (BuildContext context) => QuizPost(),
    QUIZ_DETAIL: (BuildContext context) => QuizDetail()
  };
}
