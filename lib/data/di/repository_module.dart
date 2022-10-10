import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/data/repository_impl/user_data_repository_impl.dart';


final userDataRepositoryProvider = Provider.autoDispose(
      (ref) => UserDataRepositoryImpl(),
);