// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/domain/use_cases/profile_use_case.dart';
import 'package:share_quiz/presentation/utility/widget_utils.dart';
import '../../data/repository_impl/profile_repository_impl.dart';
import '../../data/repository_impl/user_quizzes_repository_impl.dart';
import '../../domain/models/pagination_state/pagination_state.dart';
import '../../domain/models/user/user_data.dart';
import '../../domain/models/user_quizzes/user_quizzes.dart';
import '../../domain/models/user_quizzes/user_quizzes_repository.dart';
import '../../domain/repository/profile_repository.dart';
import '../../domain/use_cases/user_quizzes_use_case.dart';

final _profileRepositoryProvider =
    Provider.autoDispose<ProfileRepository>((ref) {
  return ProfileRepositoryImpl();
});

final _profileUseCaseProvider = FutureProvider.autoDispose<UserData>((ref) {
  var repository = ref.read(_profileRepositoryProvider);
  return ProfileUseCase(repository).fetch();
});

final _userQuizzesProvider = Provider.autoDispose<UserQuizzesRepository>((ref) {
  return UserQuizzesRepositoryImpl();
});

final _userQuizzesUseCaseProvider =
    StateNotifierProvider<UserQuizzesUseCase, PaginationState<UserQuizzes>>(
  (ref) {
    final repository = ref.read(_userQuizzesProvider);
    return UserQuizzesUseCase(repository);
  },
);

final _scrollControllerProvider = Provider<ScrollController>((ref) {
  final controller = ScrollController();
  controller.addListener(() {
    if (controller.position.atEdge) {
      if (controller.position.pixels != 0) {
        ref
            .read(_userQuizzesUseCaseProvider.notifier)
            .fetchQuizzes('YOUR_UID_HERE', 1); // TODO: UIDとページ数を適切に設定してください。
      }
    }
  });
  return controller;
});

class ProfileScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userQuizzesState = ref.watch(_userQuizzesUseCaseProvider);
    final scrollController = ref.watch(_scrollControllerProvider);
    var profile = ref.watch(_profileUseCaseProvider);
    useEffect(() {
      ref
          .read(_userQuizzesUseCaseProvider.notifier)
          .fetchQuizzes('YOUR_UID_HERE', 1);
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
              SizedBox(height: 10.0),
              // ユーザー名表示
              Text(
                user.name ?? "",
                style: TextStyle(
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
        child: Text('エラーが発生しました'),
      ),
      loading: () => WidgetUtils.loading(),
    );

    Widget quizzesWidget = userQuizzesState.when<Widget>(
      loading: () => CircularProgressIndicator(),
      success: (quizzes) => ListView.builder(
        controller: scrollController,
        itemCount: quizzes.quizzes.length,
        itemBuilder: (context, index) =>
            ListTile(title: Text('Quiz: ${quizzes.quizzes[index].title}')),
      ),
      error: (error, stackTrace, previousData) =>
          Center(child: Text('エラーが発生しました: $error')),
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
          SliverToBoxAdapter(child: quizzesWidget),
        ],
      ),
    );
  }
}
