// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share/share.dart';

// Project imports:
import 'package:share_quiz/domain/common/resource.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';
import 'package:share_quiz/domain/quiz_answer_data/quiz_answer_data.dart';
import 'package:share_quiz/domain/quiz_answer_data/quiz_answer_data_notifer.dart';
import 'package:share_quiz/domain/quiz_answer_post/quiz_answer_post_repository.dart';
import 'package:share_quiz/presentation/widget/widget_utils.dart';

class QuizAnswer extends HookWidget {
  final quizAnswerProvider =
      StateNotifierProvider((_) => QuizAnswerDataNotifier());

  final repository = QuizAnswerPostRepository();

  @override
  Widget build(BuildContext context) {
    final quizAnswer = useProvider(quizAnswerProvider.select((value) => value));
    final quizAnswerNotifier = useProvider(quizAnswerProvider.notifier);

    if (quizAnswer is Loading) {
      final quizId = ModalRoute.of(context)!.settings.arguments as String;
      quizAnswerNotifier.fetch(quizId);
      return _loading();
    } else if (quizAnswer is Failure) {
      return _error();
    } else if (quizAnswer is Success) {
      return _success(
        context,
        (quizAnswer as Success<QuizAnswerData>).value,
        quizAnswerNotifier,
      );
    } else {
      throw Exception();
    }
  }

  Widget _loading() {
    return Scaffold(
      appBar: AppBar(),
      body: WidgetUtils.loading(),
    );
  }

  Widget _error() {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          "未ログインです。クイズに答えるにはホームからログインしてください。",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  final selectProvider = StateNotifierProvider((_) => _Select());

  Widget _success(
    BuildContext context,
    QuizAnswerData quizAnswerData,
    QuizAnswerDataNotifier notifier,
  ) {
    final selectNotifier = useProvider(selectProvider.notifier);

    final theme = Theme.of(context);
    final quiz = quizAnswerData.quiz;

    List<Widget> list = [];
    if (quiz.imageUrl != null) {
      list.add(WidgetUtils.getQuizImage(250.0, quiz.imageUrl!));
    } else {
      list.add(WidgetUtils.getNoImage(100));
    }

    list.add(
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          "問題　${quiz.question}",
          style: theme.textTheme.headline5,
        ),
      ),
    );

    final correctRate = quiz.car;
    if (correctRate != null) {
      list.add(
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "正解率は${(correctRate * 100).toInt()}％だよ",
            style: theme.textTheme.caption,
          ),
        ),
      );
    }

    list.add(
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Text(
          "正解だと思う選択肢にチェックをいれてね",
          style: theme.textTheme.bodyText1,
        ),
      ),
    );

    var selectValue = useProvider(selectProvider.select((value) => value));

    createChoices(ValueChanged<int?>? onChanged) =>
        quiz.choices.asMap().entries.map(
          (entry) {
            final idx = entry.key;
            final val = entry.value;
            return RadioListTile<int>(
              key: Key(idx.toString()),
              value: idx,
              groupValue: selectValue,
              title: Text(val),
              onChanged: onChanged,
            );
          },
        );

    final Function()? answerOnPressed;
    if (quizAnswerData.select_anser == null) {
      list.addAll(
        createChoices(
          (v) {
            selectNotifier.select = v!;
          },
        ),
      );

      answerOnPressed =
          () => _showAnswerDialog(context, selectValue, quiz, notifier);
    } else {
      selectValue = quizAnswerData.select_anser!;
      answerOnPressed = null;

      list.addAll(createChoices(null));

      list.add(
        const SizedBox(
          height: 16,
        ),
      );

      list.add(
        Text(
          "答えは「${quiz.choices[quiz.correctAnswer]}」！",
        ),
      );

      list.add(
        const SizedBox(
          height: 8,
        ),
      );
      String text;
      if (selectValue == quiz.correctAnswer) {
        text = "正解だよ！";
      } else {
        text = "不正解だよ！";
      }
      list.add(
        Text(
          text,
        ),
      );
    }

    list.add(
      const SizedBox(
        height: 16,
      ),
    );

    list.add(
      TextButton.icon(
        icon: Icon(Icons.share),
        onPressed: () {
          Share.share("タイトル：${quiz.title}\n問題：${quiz.question}\n#みんなのクイズ");
        },
        label: Text("シェア"),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: list,
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.question_answer_rounded),
            label: const Text('　　回答する　　'),
            onPressed: answerOnPressed,
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }

  _showAnswerDialog(
    BuildContext context,
    int select,
    Quiz quiz,
    QuizAnswerDataNotifier notifier,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          content: Text(
              "問題：${quiz.question}\n回答：${quiz.choices[select]}\nこちらの回答でよろしいですか？"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                repository.post(quiz.documentId, select).then(
                  (value) {
                    final quizId =
                        ModalRoute.of(context)!.settings.arguments as String;
                    notifier.fetch(quizId);
                  },
                ).catchError(
                  (error) {},
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _Select extends StateNotifier<int> {
  _Select() : super(0);

  set select(int select) {
    state = select;
  }
}
