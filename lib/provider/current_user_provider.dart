// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/models/user/user_data.dart';

final currentUserProvider = StreamProvider.autoDispose<UserData?>((ref) {
  throw UnimplementedError();
});
