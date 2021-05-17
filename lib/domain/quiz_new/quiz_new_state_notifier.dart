import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/data/quiz/quiz_state_mapper.dart';
import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/domain/quiz_new/quiz_new_state.dart';
import 'package:state_notifier/state_notifier.dart';

class QuizNewStateNotifier extends StateNotifier<QuizNewState> {

  final _dataStore = QuizFirebaseStore();

  QuizNewStateNotifier() : super(QuizNewState.loading()) {
    () async {
      final data = await _dataStore.fetchNews();
      state = await QuizNewStateMapper.transform(data);
    }();
  }
}
