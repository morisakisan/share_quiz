import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/repository/delete_user_repository.dart';

final deleteUserRepositoryProvider =
    Provider.autoDispose<DeleteUserRepository>((ref) {
  throw UnimplementedError();
});
