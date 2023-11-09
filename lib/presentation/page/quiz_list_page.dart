// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/presentation/common/quiz_grid_item.dart';
import '../../domain/models/quiz_list/quiz_list.dart';
import '../../presentation/utility/error_handler.dart';
import '../../presentation/utility/widget_utils.dart';

class QuizListPage extends HookConsumerWidget {
  final AutoDisposeStreamProvider<QuizList> _provider;

  const QuizListPage(this._provider, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var async = ref.watch(_provider);
    return async.when(
      data: (list) => GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2列
          childAspectRatio: 0.8, // カードの縦横比
          crossAxisSpacing: 8.0, // 横のスペース
          mainAxisSpacing: 8.0, // 縦のスペース
        ),
        itemCount: list.quizzes.length,
        itemBuilder: (context, index) {
          return QuizGridItem(list.quizzes[index]);
        },
      ),
      loading: () => WidgetUtils.loading(),
      error: (error, stack) => Text(
        ErrorHandler.getMessage(error, stack),
      ),
    );
  }
}
