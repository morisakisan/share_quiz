// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

// Project imports:
import '../../domain/models/quiz/quiz.dart';
import '../../provider/profile_use_case_provider.dart';
import '../../provider/user_quizzes_use_case_provider.dart';
import '../nav.dart';
import '../utility/error_handler.dart';
import '../utility/widget_utils.dart';

final _scrollControllerProvider = Provider.autoDispose<ScrollController>((ref) {
  final controller = ScrollController();
  controller.addListener(() {
    var hasMore = ref.read(userQuizzesUseCaseProvider).map(
        loading: (value) => false,
        success: (value) {
          return value.data.pagination.hasMore;
        },
        error: (value) => false);
    if (controller.position.atEdge &&
        controller.position.pixels != 0 &&
        hasMore) {
      ref.read(userQuizzesUseCaseProvider.notifier).fetchQuizzes(1);
    }
  });
  return controller;
});

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userQuizzesState = ref.watch(userQuizzesUseCaseProvider);
    final scrollController = ref.watch(_scrollControllerProvider);
    var profile = ref.watch(profileUseCaseProvider);
    useEffect(() {
      ref.read(userQuizzesUseCaseProvider.notifier).fetchQuizzes(1);
      return null;
    }, const []);

    Widget profileWidget = profile.when<Widget>(
      data: (user) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // アバター表示
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(user.photoUrl ?? ""),
              ),
              const SizedBox(height: 10.0),
              // ユーザー名表示
              Text(
                user.name ?? "",
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
      error: (object, stackTrace) => const Center(
        child: Text('エラーが発生しました'),
      ),
      loading: () => WidgetUtils.loading(),
    );

    Widget quizzesWidget = userQuizzesState.when<Widget>(
      loading: () => SliverToBoxAdapter(
        child: WidgetUtils.loading(),
      ),
      success: (quizzes) {
        if (quizzes.quizzes.isEmpty) {
          return const SliverToBoxAdapter(
            child: Text("データがありません。"),
          );
        }

        int length = quizzes.quizzes.length;
        if (quizzes.pagination.hasMore) {
          length++;
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == quizzes.quizzes.length &&
                  quizzes.pagination.hasMore) {
                return WidgetUtils.loading();
              }
              return _getQuizView(context, quizzes.quizzes[index]);
            },
            childCount: length,
          ),
        );
      },
      error: (error, stackTrace, previousData) => SliverToBoxAdapter(
        child: Center(child: Text(ErrorHandler.getMessage(error, stackTrace))),
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // 背景色や背景画像などを設定できます
                  Container(color: Colors.blue),
                  profileWidget
                ],
              ),
            ),
          ),
          quizzesWidget,
        ],
      ),
    );
  }

  Widget _getQuizView(BuildContext context, Quiz quiz) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final formatter = DateFormat(appLocalizations.dateFormat, "ja_JP");
    String? formatted;
    if (quiz.createdAt != null) {
      formatted = formatter.format(quiz.createdAt!);
    }

    final List<Widget> list = [];

    createImage(image) => Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
          child: image,
        );

    const imageSize = 125.0;
    if (quiz.imageUrl != null) {
      list.add(
        createImage(WidgetUtils.getQuizImage(imageSize, quiz.imageUrl!)),
      );
    } else {
      list.add(
        createImage(WidgetUtils.getNoImage(context, imageSize)),
      );
    }

    final String correctRate;
    if (quiz.correctAnswerRate != null) {
      correctRate = appLocalizations
          .correctRateWithPercent((quiz.correctAnswerRate! * 100).toInt());
    } else {
      correctRate = "";
    }

    list.add(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            quiz.title,
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            appLocalizations.questionText(quiz.question),
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            appLocalizations.answerCountWithRate(
                quiz.answerCount ?? 0, correctRate),
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: list,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.question_answer_rounded),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Nav.quizDetail,
                    arguments: quiz.documentId,
                  );
                },
                label: Text(appLocalizations.answerTheQuiz),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: Text(
              formatted ?? "",
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
