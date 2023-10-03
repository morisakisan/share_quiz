// Package imports:
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/domain/repository/quiz_post_repository.dart';

import '../models/quiz_post/quiz_post_data.dart';

class QuizPostUseCase extends StateNotifier<AsyncValue<void>?> {
  final _repository = QuizPostRepository();

  QuizPostUseCase() : super(null);

  post(QuizPostData post) async {
    try {
      await _repository.store(post);
      state = AsyncValue.data(null);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}
