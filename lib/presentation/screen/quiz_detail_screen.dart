// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

// Project imports:
import 'package:share_quiz/data/repository_impl/quiz_answer_post_repository_impl.dart';
import 'package:share_quiz/domain/repository/quiz_good_post_repository.dart';
import 'package:share_quiz/domain/use_cases/quiz_detail_use_case.dart';
import 'package:share_quiz/presentation/utility/error_handler.dart';
import 'package:share_quiz/presentation/utility/widget_utils.dart';
import '../../data/repository_impl/login_repository_impl.dart';
import '../../data/repository_impl/quiz_detail_repository_impl.dart';
import '../../data/repository_impl/quiz_good_post_repository_impl.dart';
import '../../domain/models/quiz/quiz.dart';
import '../../domain/models/quiz_detail/quiz_detail.dart';
import '../../domain/repository/login_repository.dart';
import '../../domain/repository/quiz_answer_post_repository.dart';
import '../../domain/repository/quiz_detail_repository.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/quiz_answer_post_use_case.dart';
import '../../domain/use_cases/quiz_good_post_use_case.dart';

final _repositoryProvider =
    Provider.autoDispose<QuizAnswerPostRepository>((ref) {
  return QuizAnswerPostRepositoryImpl();
});

final _postNotifierProvider =
    StateNotifierProvider.autoDispose<QuizAnswerPostUseCase, AsyncValue<void>?>(
        (ref) {
  var repo = ref.read(_repositoryProvider);
  return QuizAnswerPostUseCase(repo);
});

final _quizDetailRepositoryProvider =
    Provider.autoDispose<QuizDetailRepository>((ref) {
  return QuizDetailRepositoryImpl();
});

final _quizDetailProvider =
    StreamProvider.autoDispose.family<QuizDetail, String>((ref, quizId) {
  var repo = ref.read(_quizDetailRepositoryProvider);
  return QuizDetailUseCase(repo, quizId).build();
});

final _selectProvider =
    StateNotifierProvider.autoDispose<_Select, int>((_) => _Select());

final _loginRepositoryProvider = Provider.autoDispose<LoginRepository>((ref) {
  return LoginRepositoryImpl();
});

final _loginUseCaseProvider =
    StateNotifierProvider.autoDispose<LoginUseCase, AsyncValue<void>>((ref) {
  var repository = ref.read(_loginRepositoryProvider);
  return LoginUseCase(repository);
});

final _quizGoodPostRepositoryProvider =
    Provider.autoDispose<QuizGoodPostRepository>((ref) {
  return QuizGoodPostRepositoryImpl();
});

final _quizGoodPostUseCaseProvider =
    StateNotifierProvider.autoDispose<QuizGoodPostUseCase, AsyncValue<void>?>(
        (ref) {
  var repository = ref.read(_quizGoodPostRepositoryProvider);
  return QuizGoodPostUseCase(repository);
});

class QuizDetailScreen extends HookConsumerWidget {
  const QuizDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizId =
        useState<String>(ModalRoute.of(context)!.settings.arguments as String);
    final quizDetail = ref.watch(_quizDetailProvider(quizId.value));

    return quizDetail.when(data: (data) {
      return _Success(data);
    }, error: (error, stackTrace) {
      return _Error(error, stackTrace);
    }, loading: () {
      return _Loading();
    });
  }
}

class _Success extends HookConsumerWidget {
  final QuizDetail _quizDetail;

  const _Success(this._quizDetail);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var quizGoodPostUseCase = ref.read(_quizGoodPostUseCaseProvider.notifier);
    var quizGoodPost = ref.watch(_quizGoodPostUseCaseProvider);
    var userLoginUseCase = ref.watch(_loginUseCaseProvider.notifier);
    final selectNotifier = ref.read(_selectProvider.notifier);
    var selectValue = ref.watch(_selectProvider.select((value) => value));
    final theme = Theme.of(context);
    final quiz = _quizDetail.quiz;

    List<Widget> list = [];
    if (quiz.imageUrl != null) {
      Widget image = WidgetUtils.getQuizImage(250.0, quiz.imageUrl!);
      list.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start, // ここで指定
        children: <Widget>[image],
      ));
    }

    final appLocalizations = AppLocalizations.of(context)!;
    list.add(
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          appLocalizations.displayQuestion(quiz.question),
          style: theme.textTheme.headlineSmall,
        ),
      ),
    );

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
    if (_quizDetail.userQuizInteraction.selectAnswer == null) {
      list.addAll(
        createChoices(
          (v) {
            selectNotifier.select = v!;
          },
        ),
      );

      answerOnPressed = () {
        if (!_quizDetail.userQuizInteraction.isLogin) {
          _showLoginDialog(context, userLoginUseCase);
          return;
        }
        _showAnswerDialog(context, selectValue, quiz);
      };
    } else {
      selectValue = _quizDetail.userQuizInteraction.selectAnswer!;
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

    return Scaffold(
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
              icon: Icon(_quizDetail.userQuizInteraction.hasGood
                  ? Icons.thumb_up_alt
                  : Icons.thumb_up_off_alt),
              onPressed: () {
                quizGoodPostUseCase.post(
                    quiz.documentId, !_quizDetail.userQuizInteraction.hasGood);
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
    );
  }

  _showAnswerDialog(BuildContext context, int select, Quiz quiz) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        final appLocalizations = AppLocalizations.of(dialogContext)!;
        return Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(_postNotifierProvider);
            final quizAnswerNotifier = ref.read(_postNotifierProvider.notifier);
            if (state is AsyncLoading) {
              return WidgetUtils.loadingScreen(context);
            } else if (state is AsyncData) {
              Navigator.pop(dialogContext);
              return WidgetUtils.loadingScreen(context);
            } else if (state is AsyncError) {
              return ErrorHandler.getAlertDialog(
                  context, state.error, state.stackTrace);
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

  _showLoginDialog(
    BuildContext context,
    LoginUseCase notifier,
  ) {
    final appLocalizations = AppLocalizations.of(context)!;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Text(appLocalizations.login_required_to_post),
          actions: [
            // ボタン領域
            TextButton(
              child: Text(appLocalizations.cancel),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text(appLocalizations.ok),
              onPressed: () {
                Navigator.pop(context);
                notifier.signInWithGoogle();
              },
            ),
          ],
        );
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
    return Scaffold(appBar: AppBar(), body: WidgetUtils.loading());
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
