

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/repository/profile_repository.dart';

final profileRepositoryProvider = Provider.autoDispose<ProfileRepository>((ref) {
  throw UnimplementedError();
});
