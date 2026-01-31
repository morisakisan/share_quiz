// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/features/profile/domain/repositories/profile_repository.dart';

final profileRepositoryProvider = Provider.autoDispose<ProfileRepository>((ref) {
  throw UnimplementedError();
});
