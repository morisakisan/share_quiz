// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

// Project imports:
import 'package:share_quiz/data/repository_impl/quiz_answer_post_repository_impl.dart';
import 'package:share_quiz/domain/usecases/quiz_detail_use_case.dart';
import 'package:share_quiz/presentation/utility/FirebaseErrorHandler.dart';
import 'package:share_quiz/presentation/utility/widget_utils.dart';
import '../../data/repository_impl/quiz_detail_repository_impl.dart';
import '../../domain/di/UseCaseModule.dart';
import '../../domain/models/quiz/quiz.dart';
import '../../domain/models/quiz_detail/quiz_detail.dart';
import '../../domain/repository/quiz_answer_post_repository.dart';
import '../../domain/repository/quiz_detail_repository.dart';
import '../../domain/usecases/quiz_answer_post_use_case.dart';
import '../../domain/usecases/user_login_use_case.dart';

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

final quizDetailProvider =
    StreamProvider.autoDispose.family<QuizDetail, String>((ref, quizId) {
  var repo = ref.read(quizDetailRepositoryProvider);
  return QuizDetailUseCase(repo, quizId).build();
});

final selectProvider =
    StateNotifierProvider.autoDispose<_Select, int>((_) => _Select());

class QuizDetailScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizId =
        useState<String>(ModalRoute.of(context)!.settings.arguments as String);
    final quizAnswer = ref.watch(quizDetailProvider(quizId.value));
    if (quizAnswer is AsyncLoading) {
      return _loading();
    } else if (quizAnswer is AsyncError) {
      var error = (quizAnswer as AsyncError);
      return Text(FirebaseErrorHandler.getMessage(error.error, error.stackTrace));
    } else if (quizAnswer is AsyncData) {
      return _success(
          context, (quizAnswer as AsyncData<QuizDetail>).value, ref);
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

  Widget _success(
      BuildContext context, QuizDetail quizAnswerData, WidgetRef ref) {
    var userLoginUseCase = ref.watch(userLoginUseCaseProvider.notifier);
    useEffect(() {
      // ウィジェットの起動時にだけ実行される処理
      userLoginUseCase.fetch();
      return () {
        // オプション: ウィジェットがアンマウントされるときのクリーンアップ処理
      };
    }, []);

    final selectNotifier = ref.read(selectProvider.notifier);
    var selectValue = ref.watch(selectProvider.select((value) => value));
    final theme = Theme.of(context);
    final quiz = quizAnswerData.quiz;

    List<Widget> list = [];
    if (quiz.imageUrl != null) {
      list.add(WidgetUtils.getQuizImage(250.0, quiz.imageUrl!));
    } else {
      list.add(WidgetUtils.getNoImage(context, 100));
    }
    final appLocalizations = AppLocalizations.of(context)!;
    list.add(
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          appLocalizations.displayQuestion(quiz.question),
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
            appLocalizations.displayCorrectRate((correctRate * 100).toInt()),
            style: theme.textTheme.caption,
          ),
        ),
      );
    }

    list.add(
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Text(
          appLocalizations.chooseCorrectChoice,
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

      answerOnPressed = () {
        if (!quizAnswerData.isLogin) {
          _showLoginDialog(context, userLoginUseCase);
          return;
        }
        _showAnswerDialog(context, selectValue, quiz);
      };
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
          appLocalizations.answerRevealFormat(quiz.choices[quiz.correctAnswer]),
        ),
      );

      list.add(
        const SizedBox(
          height: 8,
        ),
      );
      final String text;
      if (selectValue == quiz.correctAnswer) {
        text = appLocalizations.correctAnswer;
      } else {
        text = appLocalizations.wrongAnswer;
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
          Share.share(appLocalizations.shareFormat(quiz.title, quiz.question));
        },
        label: Text(appLocalizations.share),
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
            label: Text(appLocalizations.answer),
            onPressed: answerOnPressed,
          ),
          const SizedBox(
            height: 8,
          )
        ],
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
            final state = ref.watch(postNotifierProvider);
            final quizAnswerNotifier = ref.read(postNotifierProvider.notifier);
            if (state is AsyncLoading) {
              return CircularProgressIndicator();
            } else if (state is AsyncData) {
              Navigator.pop(dialogContext);
              return CircularProgressIndicator();
            } else if (state is AsyncError) {
              return FirebaseErrorHandler.getAlertDialog(context, state.error, state.stackTrace);
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
    UserLoginUseCase notifier,
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
