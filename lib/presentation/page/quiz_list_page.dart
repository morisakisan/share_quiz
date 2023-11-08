// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

// Project imports:
import '../../domain/models/quiz/quiz.dart';
import '../../domain/models/quiz_list/quiz_list.dart';
import '../../presentation/utility/error_handler.dart';
import '../../presentation/utility/widget_utils.dart';
import '../common/quiz_item.dart';
import '../nav.dart';

class QuizListPage extends HookConsumerWidget {
  final AutoDisposeStreamProvider<QuizList> _provider;

  const QuizListPage(this._provider, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var async = ref.watch(_provider);
    return async.when(
      data: (list) => ListView(
        padding: const EdgeInsets.all(8.0),
        children: list.quizzes.map(
          (value) {
            return QuizItem(value);
          },
        ).toList(),
      ),
      loading: () => WidgetUtils.loading(),
      error: (error, stack) => Text(
        ErrorHandler.getMessage(error, stack),
      ),
    );
  }
}
