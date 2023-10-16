// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';

// Project imports:
import 'package:share_quiz/presentation/utility/widget_utils.dart';

class SettingScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.settings),
      ),
      body: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return WidgetUtils.loading();
          } else {
            return _buildSettingsList(snapshot.data!, context);
          }
        },
      ),
    );
  }

  Widget _buildSettingsList(PackageInfo info, BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return SettingsList(
      sections: [
        SettingsSection(
          tiles: [
            SettingsTile(
              title: "退会",
              leading: const Icon(Icons.exit_to_app),
            ),
            SettingsTile(
              title: appLocalizations.license,
              leading: const Icon(Icons.gavel),
              onPressed: (context) {
                showLicensePage(
                  context: context,
                  applicationName: info.appName,
                  applicationVersion: info.version,
                );
              },
            ),
            SettingsTile(
              title: appLocalizations.version,
              leading: const Icon(Icons.info_outline),
              trailing: Text(info.version),
            ),
          ],
        ),
      ],
    );
  }
}
