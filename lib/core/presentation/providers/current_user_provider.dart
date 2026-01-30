// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/core/domain/models/user_data.dart';

final currentUserProvider = StreamProvider.autoDispose<UserData?>((ref) {
  throw UnimplementedError();
});
