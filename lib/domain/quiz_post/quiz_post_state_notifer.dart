// Package imports:
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import 'package:share_quiz/domain/common/resource.dart';
import 'package:share_quiz/domain/quiz_post/quiz_post_data.dart';
import 'package:share_quiz/domain/quiz_post/quiz_post_repository.dart';

class QuizPostStateNotifier extends StateNotifier<Resource<Object?>?> {
  final _repository = QuizPostRepository();

  QuizPostStateNotifier() : super(null);

  post(QuizPostData post, BuildContext context) async {
    state = Resource.loading();
    _repository.store(post).then((value) {
      state = Resource(null);
      Navigator.pop(context);
    }).catchError((onError) {
      state = Resource.error(onError);
    });
  }
}
