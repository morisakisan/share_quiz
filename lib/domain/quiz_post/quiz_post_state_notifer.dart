// Package imports:
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import 'package:share_quiz/domain/quiz_post/quiz_post_data.dart';
import 'package:share_quiz/domain/quiz_post/quiz_post_repository.dart';

class QuizPostStateNotifier extends StateNotifier<AsyncValue<Object?>?> {
  final _repository = QuizPostRepository();

  QuizPostStateNotifier() : super(null);

  post(QuizPostData post, BuildContext context) async {
    try {
      await _repository.store(post);
      state = AsyncValue.data(null);
      Navigator.pop(context);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}
