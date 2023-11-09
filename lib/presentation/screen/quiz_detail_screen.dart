// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:share_quiz/presentation/common/custom_alert_dialog.dart';

// Project imports:
import '../../domain/models/quiz/quiz.dart';
import '../../domain/models/quiz_detail/quiz_detail.dart';
import '../../presentation/utility/error_handler.dart';
import '../../provider/quiz_answer_post_use_case_provider.dart';
import '../../provider/quiz_detail_provider.dart';
import '../../provider/quiz_good_post_use_case_provider.dart';
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
      data: (data) => _Success(data),
      error: (error, stackTrace) => _Error(error, stackTrace),
      loading: () => _Loading(),
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
    List<Widget> list = [];

    //画像
    if (quiz.imageUrl != null) {
      Widget image = QuizImage(imageSize: 250.0, imageUrl: quiz.imageUrl!);
      list.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[image],
        ),
      );

      list.add(const SizedBox(height: 16));
    }

    //問題文
    list.add(
      Text(
        appLocalizations.displayQuestion(quiz.question),
        style: theme.textTheme.headlineSmall,
      ),
    );

    //正解率
    final correctRate = quiz.correctAnswerRate;
    if (correctRate != null) {
      list.add(const SizedBox(height: 8));
      list.add(
        Text(
          appLocalizations.displayCorrectRate((correctRate * 100).toInt()),
          style: theme.textTheme.bodySmall,
        ),
      );
    }

    list.add(const SizedBox(height: 24));
    list.add(
      Text(
        appLocalizations.chooseCorrectChoice,
        style: theme.textTheme.bodyLarge,
      ),
    );

    final Function()? answerOnPressed;
    if (userQuizInteraction.selectAnswer == null) {
      list.addAll(
        _createChoices(
          quiz,
          selectValue,
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
        _showAnswerDialog(context, ref, selectValue, quiz);
      };
    } else {
      selectValue = userQuizInteraction.selectAnswer!;
      answerOnPressed = null;

      list.addAll(_createChoices(quiz, selectValue, null));

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

    final quizAnswerPost = ref.watch(quizAnswerPostUseCaseProvider);
    if (quizAnswerPost is AsyncLoading) {
      return const LoadingScreen();
    } else if (quizAnswerPost is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ErrorHandler.showErrorDialog(
              context, quizAnswerPost.error, quizAnswerPost.stackTrace);
        },
      );
    }

    return Stack(children: stackChildren);
  }

  Iterable<RadioListTile<int>> _createChoices(
      Quiz quiz, int selectValue, ValueChanged<int?>? onChanged) {
    return quiz.choices.asMap().entries.map(
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
  }

  _showAnswerDialog(
      BuildContext context, WidgetRef ref, int select, Quiz quiz) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        final appLocalizations = AppLocalizations.of(dialogContext)!;
        final quizAnswerNotifier =
            ref.read(quizAnswerPostUseCaseProvider.notifier);
        return CustomAlertDialog(
          title: appLocalizations.answer,
          message: appLocalizations.confirmAnswerFormat(
              quiz.question, quiz.choices[select]),
          onOkPressed: () {
            quizAnswerNotifier.post(quiz.documentId, select);
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
