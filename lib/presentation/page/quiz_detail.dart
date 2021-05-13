import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';

class QuizDetail extends HookWidget {
  final counterProvider = StateNotifierProvider((_) => Select());

  @override
  Widget build(BuildContext context) {
    final state = useProvider(counterProvider.select((value) => value));
    final select = useProvider(counterProvider.notifier);
    final quiz = ModalRoute.of(context)!.settings.arguments as Quiz;
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
              Text(
                quiz.question,
                style: TextStyle(fontSize: 40.0),
              ),
            ] +
            quiz.choices.asMap().entries.map(
              (entry) {
                final idx = entry.key;
                final val = entry.value;
                return RadioListTile(
                  key: Key(idx.toString()),
                  value: idx,
                  groupValue: state,
                  title: Text(val),
                  onChanged: (v) {
                    select.select = v as int;
                  },
                );
              },
            ).toList() +
            [
              TextButton(
                child: Text('回答する'),
                onPressed: () {
                  final String text;
                  if(state == quiz.answer) {
                    text = "正解です。";
                  } else {
                    text = "間違いです。";
                  }

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(text),
                  ));
                },
              ),
            ],
      ),
    );
  }
}

class Select extends StateNotifier<int> {
  Select() : super(0);

  set select(int select) {
    state = select;
  }
}
