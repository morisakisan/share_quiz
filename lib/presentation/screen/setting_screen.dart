// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/domain/repository/setting_repository.dart';
import 'package:share_quiz/presentation/utility/widget_utils.dart';
import '../../data/repository_impl/delete_user_repository_impl.dart';
import '../../data/repository_impl/setting_repository_impl.dart';
import '../../domain/models/setting/setting.dart';
import '../../domain/repository/delete_user_repository.dart';
import '../../domain/usecases/delete_user_use_case.dart';
import '../../domain/usecases/setting_usecase.dart';
import '../utility/FirebaseErrorHandler.dart';

final settingRepositoryProvider =
    Provider.autoDispose<SettingRepository>((ref) {
  return SettingRepositoryImpl();
});

final settingUseCaseProvider = StreamProvider.autoDispose<Setting>((ref) {
  var repo = ref.read(settingRepositoryProvider);
  return SettingUseCase(repo).build();
});

final deleteUserRepositoryProvider =
Provider.autoDispose<DeleteUserRepository>((ref) {
  return DeleteUserRepositoryImpl();
});

final deleteUserUseCaseProvider = StateNotifierProvider.autoDispose<DeleteUserUseCase, AsyncValue<void>?>((ref) {
  var repo = ref.read(deleteUserRepositoryProvider);
  return DeleteUserUseCase(repo);
});

class SettingScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final useCase = ref.watch(settingUseCaseProvider);
    Widget body;
    if (useCase is AsyncLoading) {
      body = WidgetUtils.loading();
    } else if (useCase is AsyncData) {
      body = _buildSettingsList(useCase.value!, context);
    } else if (useCase is AsyncError) {
      var error = (useCase as AsyncError);
      return Text(
          FirebaseErrorHandler.getMessage(error.error, error.stackTrace));
    } else {
      throw Exception();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.settings),
      ),
      body: body,
    );
  }

  Widget _buildSettingsList(Setting setting, BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    List<AbstractTile> tiles = [];

    if (setting.isLogin) {
      tiles.add(SettingsTile(
        title: "退会",
        leading: const Icon(Icons.exit_to_app),
        onPressed: (context) {

        }
      ));
    }

    tiles.add(SettingsTile(
      title: appLocalizations.license,
      leading: const Icon(Icons.gavel),
      onPressed: (context) {
        showLicensePage(
          context: context,
          applicationName: setting.packageInfo.appName,
          applicationVersion: setting.packageInfo.version,
        );
      },
    ));

    tiles.add(SettingsTile(
      title: appLocalizations.version,
      leading: const Icon(Icons.info_outline),
      trailing: Text(setting.packageInfo.version),
    ));

    return SettingsList(
      sections: [
        SettingsSection(
          tiles: tiles,
        ),
      ],
    );
  }
}
