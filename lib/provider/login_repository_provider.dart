// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/repository/login_repository.dart';

final loginRepositoryProvider = Provider.autoDispose<LoginRepository>((ref) {
  throw UnimplementedError();
});
