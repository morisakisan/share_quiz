// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/repository/current_user_data_repository.dart';

final currentUserRepositoryProvider = Provider.autoDispose<CurrentUserDataRepository>((ref) {
  throw UnimplementedError();
});

