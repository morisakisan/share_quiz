import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/data/quiz/mapper.dart';
import 'package:share_quiz/data/quiz/quiz_firebase_storage.dart';
import 'package:share_quiz/domain/quiz/quiz_state.dart';
import 'package:state_notifier/state_notifier.dart';

class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier(this._read) : super(QuizState.loading()) {
    () async {
      await QuizFirebaseStorage().dummy();
      state = await _read(itemsFetcher.future);
    }();
  }

  final Reader _read;
}

final itemsFetcher = FutureProvider((ref) async {
  // ignore: top_level_function_literal_block
  return Mapper.transform();
});
