// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/domain/common/resource.dart';

// Project imports:
import 'package:share_quiz/domain/quiz_answer_data/quiz_answer_data.dart';
import 'package:share_quiz/domain/quiz_answer_data/quiz_answer_data_notifer.dart';
import 'package:share_quiz/domain/quiz_answer_post/quiz_answer_post_repository.dart';

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
    } else if (quizAnswer is Error) {
      return Container();
    } else if (quizAnswer is Success) {
      return _success(
          context, quizAnswer as Success<QuizAnswerData>, quizAnswerNotifier);
    } else {
      throw Exception();
    }
  }

  Widget _loading() {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: const SizedBox(
          height: 100,
          width: 100,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  final selectProvider = StateNotifierProvider((_) => _Select());

  Widget _success(BuildContext context, Success<QuizAnswerData> quizAnswer,
      QuizAnswerDataNotifier notifier) {
    final selectNotifier = useProvider(selectProvider.notifier);
    var selectValue = useProvider(selectProvider.select((value) => value));
    final theme = Theme.of(context);
    final QuizAnswerData quizAnswerData = quizAnswer.value;
    final quiz = quizAnswerData.quiz;

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

    final Function()? answerOnPressed;
    final ValueChanged<int?>? onChanged;
    final List<Widget> answer = [];
    if (quizAnswerData.select_anser == null) {
      answerOnPressed = () {
        repository.post(quiz.documentId, selectValue).then(
          (value) {
            final quizId = ModalRoute.of(context)!.settings.arguments as String;
            notifier.fetch(quizId);
          },
        ).catchError(
          (error) {
            print(error);
          },
        );
      };

      onChanged = (v) {
        selectNotifier.select = v!;
      };
    } else {
      selectValue = quizAnswerData.select_anser!;
      answerOnPressed = null;
      onChanged = null;
      String text;
      if(selectValue == quiz.correctAnswer) {
        text = "正解";
      } else {
        text = "不正解";
      }
      answer.add(Text(text));
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
                    return RadioListTile<int>(
                      key: Key(idx.toString()),
                      value: idx,
                      groupValue: selectValue,
                      title: Text(val),
                      onChanged: onChanged,
                    );
                  },
                ).toList() +
                [
                  ElevatedButton(
                    child: const Text('回答する'),
                    onPressed: answerOnPressed,
                  ),
                ] +
                answer,
          ),
        ),
      ),
    );
  }
}

class _Select extends StateNotifier<int> {
  _Select() : super(0);

  set select(int select) {
    state = select;
  }
}
