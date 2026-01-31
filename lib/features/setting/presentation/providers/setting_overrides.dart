// Project imports:
import 'package:share_quiz/features/setting/infrastructure/repositories/setting_repository_impl.dart';
import 'package:share_quiz/features/setting/infrastructure/repositories/delete_user_repository_impl.dart';
import 'package:share_quiz/features/setting/application/use_cases/setting_use_case.dart';
import 'package:share_quiz/features/setting/application/use_cases/delete_user_use_case.dart';
import 'package:share_quiz/features/setting/presentation/providers/setting_repository_provider.dart';
import 'package:share_quiz/features/setting/presentation/providers/setting_use_case_provider.dart';
import 'package:share_quiz/features/setting/presentation/providers/delete_user_repository_provider.dart';
import 'package:share_quiz/features/setting/presentation/providers/delete_user_use_case_provider.dart';

final settingOverrides = [
  setting_repository_provider.overrideWith((ref) {
    return SettingRepositoryImpl();
  }),
  settingUseCaseProvider.overrideWith((ref) {
    return SettingUseCase(ref.read(setting_repository_provider)).build();
  }),
  deleteUserRepositoryProvider.overrideWith((ref) {
    return DeleteUserRepositoryImpl();
  }),
  deleteUserUseCaseProvider.overrideWith((ref) {
    return DeleteUserUseCase(ref.read(deleteUserRepositoryProvider));
  }),
];
