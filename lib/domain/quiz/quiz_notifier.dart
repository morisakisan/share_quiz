import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/data/quiz/quiz_state_mapper.dart';
import 'package:share_quiz/data/quiz/quiz_firebase_storage.dart';
import 'package:share_quiz/domain/quiz/quiz_state.dart';
import 'package:state_notifier/state_notifier.dart';

class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier() : super(QuizState.loading()) {
    () async {
      await QuizFirebaseStorage().dummy();
      state = await QuizStateMapper.transform();
    }();
  }

}