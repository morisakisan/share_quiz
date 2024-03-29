// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/presentation/common/custom_alert_dialog.dart';
import '../../domain/models/setting/setting.dart';
import '../../provider/app_theme_selector_provider.dart';
import '../../provider/delete_user_use_case_provider.dart';
import '../../provider/setting_use_case_provider.dart';
import '../common/loading_screen.dart';
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
      body = _SettingItems(useCase.value!);
    } else if (useCase is AsyncError) {
      var error = useCase as AsyncError;
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ErrorHandler.showErrorDialog(context, error.error, error.stackTrace);
        },
      );
    } else if (deleteUseCaseState is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ErrorHandler.showErrorDialog(
              context, deleteUseCaseState.error, deleteUseCaseState.stackTrace);
        },
      );
    }

    children.add(
      Scaffold(
        appBar: AppBar(
          title: Text(appLocalizations.settings),
        ),
        body: body,
      ),
    );

    if (useCase is AsyncLoading || deleteUseCaseState is AsyncLoading) {
      children.add(const LoadingScreen());
    }

    return Stack(
      children: children,
    );
  }
}

class _SettingItems extends HookConsumerWidget {
  final Setting _setting;

  const _SettingItems(this._setting);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useCase = ref.watch(deleteUserUseCaseProvider.notifier);
    final appLocalizations = AppLocalizations.of(context)!;
    List<AbstractSettingsTile> tiles = [];

    final themeMode = ref.watch(appThemeSelectorProvider);

    tiles.add(
      SettingsTile(
        title: const Text("テーマ選択"),
        leading: const Icon(Icons.palette),
        onPressed: (context) {
          showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: const Text("テーマを選択"),
                children: ThemeMode.values.map((mode) {
                  return ListTile(
                    leading: Radio<ThemeMode>(
                      value: mode,
                      groupValue: themeMode,
                      onChanged: (ThemeMode? value) {
                        if (value != null) {
                          Navigator.pop(context);
                          ref.read(appThemeSelectorProvider.notifier).changeAndSave(value);
                        }
                      },
                    ),
                    title: Text(mode.toString().split('.').last),
                    onTap: () {
                      Navigator.pop(context);
                      ref.read(appThemeSelectorProvider.notifier).changeAndSave(mode);
                    },
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );

    if (_setting.isLogin) {
      tiles.add(
        SettingsTile(
          title: Text("退会"),
          leading: const Icon(Icons.exit_to_app),
          onPressed: (context) {
            showDialog(
              context: context,
              builder: (context) {
                return CustomAlertDialog(
                  title: "退会",
                  message: "退会します。よろしいですか？",
                  onOkPressed: () {
                    useCase.delete();
                  },
                );
              },
            );
          },
        ),
      );
    }

    tiles.add(
      SettingsTile(
        title: Text(appLocalizations.license),
        leading: const Icon(Icons.gavel),
        onPressed: (context) {
          showLicensePage(
            context: context,
            applicationName: _setting.packageInfo.appName,
            applicationVersion: _setting.packageInfo.version,
          );
        },
      ),
    );

    tiles.add(
      SettingsTile(
        title: Text(appLocalizations.version),
        leading: const Icon(Icons.info_outline),
        trailing: Text(_setting.packageInfo.version),
      ),
    );

    return SettingsList(
      sections: [
        SettingsSection(
          tiles: tiles,
        ),
      ],
    );
  }
}
