// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../domain/models/quiz/quiz.dart';
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
      scrollController.addListener(
        () {
          final hasMore =
              ref.read(userQuizzesUseCaseProvider)?.pagination.hasMore;
          if (scrollController.position.atEdge &&
              scrollController.position.pixels != 0 &&
              hasMore == true) {
            ref.read(userQuizzesUseCaseProvider.notifier).fetchQuizzes();
          }
        },
      );

      // ウィジェットがツリーから削除される時にリスナーを解除します。
      return () => scrollController.removeListener(() {});
    }, [scrollController]);

    final userQuizzesState = ref.watch(userQuizzesUseCaseProvider);
    var profile = ref.watch(profileUseCaseProvider);
    useEffect(() {
      ref.read(userQuizzesUseCaseProvider.notifier).fetchQuizzes();
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
      error: (object, stackTrace) => Center(
        child: Text(ErrorHandler.getMessage(object, stackTrace)),
      ),
      loading: () => const Loading(),
    );

    var pagination = userQuizzesState?.pagination;
    Widget quizzesWidget = StreamBuilder(
      stream: userQuizzesState?.quizzes,
      builder: (BuildContext context, AsyncSnapshot<List<Quiz>> snapshot) {
        if (snapshot.hasData) {
          var quizzes = snapshot.data;
          if (quizzes== null || quizzes.isEmpty == true) {
            return const SliverToBoxAdapter(
              child: Text("データがありません。"),
            );
          }
          int length = quizzes.length;
          if (pagination?.hasMore == true) {
            length++;
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                if (index == quizzes.length &&
                    pagination?.hasMore == true) {
                  return const Loading();
                }
                return QuizListItem(quizzes[index]);
              },
              childCount: length,
            ),
          );
        } else if (snapshot.hasError) {
          return Text(ErrorHandler.getMessage(snapshot.error, snapshot.stackTrace));
        } else {
          return const SliverFillRemaining(
            child: Loading(),
          );
        }
      },
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
                  Container(),
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
}
