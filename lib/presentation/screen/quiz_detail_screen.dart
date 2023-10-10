// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share/share.dart';

// Project imports:
import 'package:share_quiz/data/repository_impl/quiz_answer_post_repository_impl.dart';
import 'package:share_quiz/domain/exception/not_sign_In_exception.dart';
import 'package:share_quiz/domain/usecases/quiz_detail_use_case.dart';
import 'package:share_quiz/presentation/widget/widget_utils.dart';
import '../../data/repository_impl/quiz_detail_repository_impl.dart';
import '../../domain/models/quiz/quiz.dart';
import '../../domain/models/quiz_detail/quiz_detail.dart';
import '../../domain/repository/quiz_answer_post_repository.dart';
import '../../domain/repository/quiz_detail_repository.dart';
import '../../domain/usecases/quiz_answer_post_use_case.dart';

final repositoryProvider =
    Provider.autoDispose<QuizAnswerPostRepository>((ref) {
  return QuizAnswerPostRepositoryImpl();
});

final postNotifierProvider =
    StateNotifierProvider.autoDispose<QuizAnswerPostUseCase, AsyncValue<void>?>(
        (ref) {
  var repo = ref.read(repositoryProvider);
  return QuizAnswerPostUseCase(repo);
});

final quizDetailRepositoryProvider =
    Provider.autoDispose<QuizDetailRepository>((ref) {
  return QuizDetailRepositoryImpl();
});

final quizDetailProvider = StateNotifierProvider.autoDispose<QuizDetailUseCase,
    AsyncValue<QuizDetail>>((ref) {
  var repo = ref.read(quizDetailRepositoryProvider);
  return QuizDetailUseCase(repo);
});

final selectProvider =
    StateNotifierProvider.autoDispose<_Select, int>((_) => _Select());

class QuizDetailScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizId =
        useState<String>(ModalRoute.of(context)!.settings.arguments as String);
    final quizAnswer = ref.watch(quizDetailProvider.select((value) => value));
    final quizAnswerNotifier = ref.watch(quizDetailProvider.notifier);
    useEffect(() {
      quizAnswerNotifier.fetch(quizId.value);
      return () {};
    }, const []);
    if (quizAnswer is AsyncLoading) {
      return _loading();
    } else if (quizAnswer is AsyncError) {
      final error = (quizAnswer as AsyncError).error;
      if (error is NotSignInException) {
        return _error();
      } else {
        throw error;
      }
    } else if (quizAnswer is AsyncData) {
      return _success(context, (quizAnswer as AsyncData<QuizDetail>).value,
          quizAnswerNotifier, ref);
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

  Widget _success(BuildContext context, QuizDetail quizAnswerData,
      QuizDetailUseCase notifier, WidgetRef ref) {
    final selectNotifier = ref.read(selectProvider.notifier);
    var selectValue = ref.watch(selectProvider.select((value) => value));
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
          _showCommentBottomSheet(context);
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
      BuildContext context, int select, Quiz quiz, QuizDetailUseCase notifier) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(postNotifierProvider);
            final quizAnswerNotifier = ref.read(postNotifierProvider.notifier);
            if (state is AsyncLoading) {
              return CircularProgressIndicator();
            } else if (state is AsyncData) {
              notifier.fetch(quiz.documentId);
              Navigator.pop(dialogContext);
              return CircularProgressIndicator();
            } else if (state is AsyncError) {

            }

            return AlertDialog(
              content: Text(
                  "問題：${quiz.question}\n回答：${quiz.choices[select]}\nこちらの回答でよろしいですか？"),
              actions: [
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () => Navigator.pop(dialogContext),
                ),
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    quizAnswerNotifier.post(quiz.documentId, select);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showCommentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.8, // 画面の80%の高さ
          child: Container(
            color: Colors.white,
            child: Center(
              child: Text("Large Bottom Sheet"),
            ),
          ),
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
