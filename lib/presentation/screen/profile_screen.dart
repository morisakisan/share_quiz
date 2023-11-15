// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/presentation/common/custom_alert_dialog.dart';

// Project imports:
import '../../provider/delete_quiz_use_case_provider.dart';
import '../../provider/profile_use_case_provider.dart';
import '../../provider/user_quizzes_use_case_provider.dart';
import '../common/loading.dart';
import '../common/quiz_list_item.dart';
import '../utility/error_handler.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    useEffect(() {
      scrollController.addListener(() {
        var hasMore = ref.read(userQuizzesUseCaseProvider).map(
            loading: (value) => false,
            success: (value) {
              return value.data.pagination.hasMore;
            },
            error: (value) => false);
        if (scrollController.position.atEdge &&
            scrollController.position.pixels != 0 &&
            hasMore) {
          ref.read(userQuizzesUseCaseProvider.notifier).fetchQuizzes();
        }
      });

      // ウィジェットがツリーから削除される時にリスナーを解除します。
      return () => scrollController.removeListener(() {});
    }, [scrollController]);
    useEffect(() {
      ref.read(userQuizzesUseCaseProvider.notifier).fetchQuizzes();
      return null;
    }, const []);
    final userQuizzesState = ref.watch(userQuizzesUseCaseProvider);
    var profile = ref.watch(profileUseCaseProvider);
    Widget? title;
    Widget profileWidget = profile.when<Widget>(
      data: (user) {
        title = Text(
          user.name ?? "",
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(user.photoUrl ?? ""),
              ),
            ],
          ),
        );
      },
      error: (object, stackTrace) => Center(
        child: Text(ErrorHandler.getMessage(object, stackTrace)),
      ),
      loading: () => const Loading(),
    );

    var appBar = SliverAppBar(
      expandedHeight: 250.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [profileWidget],
        ),
        title: title,
        centerTitle: true,
      ),
    );

    Widget quizzesWidget = userQuizzesState.when<Widget>(
      loading: () => const SliverFillRemaining(
        child: Loading(),
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
                return const Loading();
              }
              return QuizListItem(
                quizzes.quizzes[index],
                (quizId) {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return CustomAlertDialog(
                        title: "削除",
                        message: "削除しますか？",
                        onOkPressed: () {
                          ref
                              .read(deleteQuizUseCaseProvider.notifier)
                              .deleteQuiz(quizId, () {});
                        },
                      );
                    },
                  );
                },
              );
            },
            childCount: length,
          ),
        );
      },
      error: (error, stackTrace, previousData) => SliverFillRemaining(
        child: Center(child: Text(ErrorHandler.getMessage(error, stackTrace))),
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          appBar,
          quizzesWidget,
        ],
      ),
    );
  }
}
