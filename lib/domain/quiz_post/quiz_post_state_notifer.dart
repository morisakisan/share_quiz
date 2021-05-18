import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/domain/quiz_post/quiz_post_data.dart';
import 'package:share_quiz/domain/quiz_post/quiz_post_repository.dart';
import 'package:share_quiz/domain/quiz_post/quiz_post_state.dart';
import 'package:state_notifier/state_notifier.dart';

class QuizPostStateNotifier extends StateNotifier<QuizPostState?> {

  final _repository = QuizPostRepository();

  QuizPostStateNotifier() : super(null);

  post(QuizPostData post) async {
    state = QuizPostState.loading();
    state = await _repository.store(post);
  }
}