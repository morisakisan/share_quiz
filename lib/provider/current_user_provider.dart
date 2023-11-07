import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/models/user/user_data.dart';

final currentUserProvider = StreamProvider.autoDispose<UserData?>((ref) {
  throw UnimplementedError();
});
