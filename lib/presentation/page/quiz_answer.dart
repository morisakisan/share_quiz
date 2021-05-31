// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/domain/quiz/quiz.dart';

class QuizAnswer extends HookWidget {
  final counterProvider = StateNotifierProvider((_) => Select());

  @override
  Widget build(BuildContext context) {
    final state = useProvider(counterProvider.select((value) => value));
    final select = useProvider(counterProvider.notifier);
    final quiz = ModalRoute.of(context)!.settings.arguments as Quiz;
    final theme = Theme.of(context);

    final Widget image;
    if (quiz.imageUrl != null) {
      image = AspectRatio(
        aspectRatio: 1.0,
        child: Hero(
          tag: quiz.imageUrl!,
          child: Image.network(quiz.imageUrl!, fit: BoxFit.cover),
        ),
      );
    } else {
      image = Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: const Text("no image"),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  image,
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      "問題　${quiz.question}",
                      style: theme.textTheme.bodyText1,
                    ),
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
                  ElevatedButton(
                    child: const Text('回答する'),
                    onPressed: () {
                      final String text;
                      if (state == quiz.answer) {
                        text = "正解です。";
                      } else {
                        text = "間違いです。";
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(text),
                        ),
                      );
                    },
                  ),
                ],
          ),
        ),
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
