// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/presentation/utility/widget_utils.dart';
import '../../domain/models/setting/setting.dart';
import '../../provider/delete_user_use_case_provider.dart';
import '../../provider/setting_use_case_provider.dart';
import '../utility/error_handler.dart';

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final useCase = ref.watch(settingUseCaseProvider);
    final deleteUseCaseState = ref.watch(deleteUserUseCaseProvider);
    List<Widget> children = [];
    Widget? body;

    if (useCase is AsyncData) {
      body =
          _buildSettingsList(useCase.value!, context, ref, deleteUseCaseState);
    } else if (useCase is AsyncError) {
      var error = useCase as AsyncError;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ErrorHandler.showErrorDialog(context, error.error, error.stackTrace);
      });
    } else if (deleteUseCaseState is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ErrorHandler.showErrorDialog(
            context, deleteUseCaseState.error, deleteUseCaseState.stackTrace);
      });
    }

    children.add(Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.settings),
      ),
      body: body,
    ));

    if (useCase is AsyncLoading || deleteUseCaseState is AsyncLoading) {
      children.add(WidgetUtils.loadingScreen(context));
    }

    return Stack(
      children: children,
    );
  }

  Widget _buildSettingsList(Setting setting, BuildContext context,
      WidgetRef ref, AsyncValue<void>? deleteUseCaseState) {
    final useCase = ref.watch(deleteUserUseCaseProvider.notifier);
    final appLocalizations = AppLocalizations.of(context)!;
    List<AbstractTile> tiles = [];

    if (setting.isLogin) {
      tiles.add(SettingsTile(
          title: "退会",
          leading: const Icon(Icons.exit_to_app),
          onPressed: (context) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(content: const Text("退会します。よろしいですか？"), actions: [
                    TextButton(
                      child: Text(appLocalizations.cancel),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: Text(appLocalizations.ok),
                      onPressed: () {
                        useCase.delete();
                        Navigator.pop(context);
                      },
                    ),
                  ]);
                });
          }));
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
