import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';
import 'package:share_quiz/domain/quiz_new/quiz_new_repository.dart';
import "package:intl/intl.dart";

import '../nav.dart';

class News extends HookWidget {
  final _repository = QuizNewRepository();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _repository.fetch(),
      builder: (BuildContext context, AsyncSnapshot<List<Quiz>> snapShot) {
        if (snapShot.hasError) {
          return Text("error");
        } else if (!snapShot.hasData) {
          return Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return ListView(
            children: snapShot.data!.map(
              (value) {
                return _getQuizView(context, value);
              },
            ).toList(),
            padding: EdgeInsets.all(16.0),
          );
        }
      },
    );
  }

  Widget _getQuizView(BuildContext context, Quiz quiz) {
    final theme = Theme.of(context);
    final formatter = DateFormat('yyyy/MM/dd(E) HH:mm', "ja_JP");
    final formatted = formatter.format(quiz.createdAt.toDate()); // Dateから

    final Widget image;
    if (quiz.imageUrl != null) {
      image = AspectRatio(
        aspectRatio: 1.0,
        child: Image.network(quiz.imageUrl!, fit: BoxFit.cover),
      );
    } else {
      image = Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text("no image"),
      );
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              quiz.title,
              style: theme.textTheme.headline5,
            ),
          ),
          image,
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
            child: Text(
              "問題　${quiz.question}",
              style: theme.textTheme.bodyText2,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Nav.QUIZ_DETAIL,
                    arguments: quiz,
                  );
                },
                child: const Text('クイズに答える'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
            child: Text(
              formatted,
              style: theme.textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
