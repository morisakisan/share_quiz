import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';
import 'package:share_quiz/domain/quiz_new/quiz_new_repository.dart';

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
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              quiz.title,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Image.network(quiz.imageUrl ?? ""),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
            child: Text(
              "問題　${quiz.question}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  primary: const Color(0xFF6200EE),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Nav.QUIZ_DETAIL,
                    arguments: quiz,
                  );
                },
                child: const Text('クイズを受ける'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
