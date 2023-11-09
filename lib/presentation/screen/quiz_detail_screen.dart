// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

// Project imports:
import '../../domain/models/quiz/quiz.dart';
import '../../domain/models/quiz_detail/quiz_detail.dart';
import '../../presentation/utility/error_handler.dart';
import '../../provider/quiz_answer_post_use_case_provider.dart';
import '../../provider/quiz_detail_provider.dart';
import '../../provider/quiz_good_post_use_case_provider.dart';
import '../common/error_dialog.dart';
import '../common/loading.dart';
import '../common/loading_screen.dart';
import '../common/login_dialog.dart';
import '../common/quiz_image.dart';

final _selectProvider =
    StateNotifierProvider.autoDispose<_Select, int>((_) => _Select());

class QuizDetailScreen extends HookConsumerWidget {
  const QuizDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizId =
        useState<String>(ModalRoute.of(context)!.settings.arguments as String);
    final quizDetail = ref.watch(quizDetailProvider(quizId.value));

    return quizDetail.when(
      data: (data) {
        return _Success(data);
      },
      error: (error, stackTrace) {
        return _Error(error, stackTrace);
      },
      loading: () {
        return _Loading();
      },
    );
  }
}

class _Success extends HookConsumerWidget {
  final QuizDetail _quizDetail;

  const _Success(this._quizDetail);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var quizGoodPostUseCase = ref.read(quizGoodPostUseCaseProvider.notifier);
    final selectNotifier = ref.read(_selectProvider.notifier);
    var selectValue = ref.watch(_selectProvider.select((value) => value));
    final theme = Theme.of(context);
    final quiz = _quizDetail.quiz;
    final userQuizInteraction = _quizDetail.userQuizInteraction;
    final appLocalizations = AppLocalizations.of(context)!;
    final question = Text(
      appLocalizations.displayQuestion(quiz.question),
      style: theme.textTheme.headlineSmall,
    );
    List<Widget> list = [];
    if (quiz.imageUrl != null) {
      Widget image = QuizImage(imageSize: 250.0, imageUrl: quiz.imageUrl!);
      list.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[image],
        ),
      );

      list.add(
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: question,
        ),
      );
    } else {
      list.add(question);
    }

    final correctRate = quiz.correctAnswerRate;
    if (correctRate != null) {
      list.add(
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            appLocalizations.displayCorrectRate((correctRate * 100).toInt()),
            style: theme.textTheme.bodySmall,
          ),
        ),
      );
    }

    list.add(
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Text(
          appLocalizations.chooseCorrectChoice,
          style: theme.textTheme.bodyLarge,
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
    if (userQuizInteraction.selectAnswer == null) {
      list.addAll(
        createChoices(
          (v) {
            selectNotifier.select = v!;
          },
        ),
      );

      answerOnPressed = () {
        if (!userQuizInteraction.isLogin) {
          _showLoginDialog(context);
          return;
        }
        _showAnswerDialog(context, selectValue, quiz);
      };
    } else {
      selectValue = userQuizInteraction.selectAnswer!;
      answerOnPressed = null;

      list.addAll(createChoices(null));

      list.add(const SizedBox(height: 16));

      list.add(
        Text(
          appLocalizations.answerRevealFormat(quiz.choices[quiz.correctAnswer]),
        ),
      );

      list.add(const SizedBox(height: 8));

      final String text;
      if (selectValue == quiz.correctAnswer) {
        text = appLocalizations.correctAnswer;
      } else {
        text = appLocalizations.wrongAnswer;
      }
      list.add(Text(text));
    }

    list.add(const SizedBox(height: 16));

    List<Widget> stackChildren = [];
    stackChildren.add(
      Scaffold(
        appBar: AppBar(
          title: Text(quiz.title),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: list,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: answerOnPressed,
          icon: const Icon(Icons.question_answer_rounded),
          label: Text(appLocalizations.answer),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(userQuizInteraction.hasGood
                    ? Icons.thumb_up_alt
                    : Icons.thumb_up_off_alt),
                onPressed: () {
                  if (!userQuizInteraction.isLogin) {
                    _showLoginDialog(context);
                    return;
                  }
                  quizGoodPostUseCase.post(quiz.documentId);
                },
                label: Text("${_quizDetail.quiz.goodCount ?? 0}"),
              ),
              TextButton.icon(
                icon: const Icon(Icons.share),
                onPressed: () {
                  Share.share(
                      appLocalizations.shareFormat(quiz.title, quiz.question));
                },
                label: Text(appLocalizations.share),
              )
              // ... その他のアイコンボタン ...
            ],
          ),
        ),
      ),
    );

    var quizGoodPost = ref.watch(quizGoodPostUseCaseProvider);
    if (quizGoodPost is AsyncLoading) {
      stackChildren.add(const Loading());
    } else if (quizGoodPost is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ErrorHandler.showErrorDialog(
              context, quizGoodPost.error, quizGoodPost.stackTrace);
        },
      );
    }
    return Stack(children: stackChildren);
  }

  _showAnswerDialog(BuildContext context, int select, Quiz quiz) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        final appLocalizations = AppLocalizations.of(dialogContext)!;
        return Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(quizAnswerPostUseCaseProvider);
            final quizAnswerNotifier =
                ref.read(quizAnswerPostUseCaseProvider.notifier);
            if (state is AsyncLoading) {
              return const LoadingScreen();
            } else if (state is AsyncData) {
              Navigator.pop(dialogContext);
              return const LoadingScreen();
            } else if (state is AsyncError) {
              return ErrorDialog(state.error, state.stackTrace);
            }

            return AlertDialog(
              content: Text(appLocalizations.confirmAnswerFormat(
                  quiz.question, quiz.choices[select])),
              actions: [
                TextButton(
                  child: Text(appLocalizations.cancel),
                  onPressed: () => Navigator.pop(dialogContext),
                ),
                TextButton(
                  child: Text(appLocalizations.ok),
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

  _showLoginDialog(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return LoginDialog(appLocalizations.login_required_to_post);
      },
    );
  }

/*  void _showCommentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.8, // 画面の80%の高さ
          child: Container(
            color: Colors.white,
            child: const Center(
              child: Text("Large Bottom Sheet"),
            ),
          ),
        );
      },
    );
  }*/
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const Loading());
  }
}

class _Error extends StatelessWidget {
  final Object? _e;
  final StackTrace _stackTrace;

  const _Error(this._e, this._stackTrace);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: Text(ErrorHandler.getMessage(_e, _stackTrace)));
  }
}

class _Select extends StateNotifier<int> {
  _Select() : super(0);

  set select(int select) {
    state = select;
  }
}
