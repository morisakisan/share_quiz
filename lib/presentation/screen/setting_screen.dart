// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:package_info/package_info.dart';

// Project imports:
import 'package:share_quiz/presentation/widget/widget_utils.dart';

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
          title: appLocalizations.others,
          titlePadding: const EdgeInsets.only(
            top: 12,
            left: 15.0,
            right: 15.0,
            bottom: 6.0,
          ),
          tiles: [
            // SettingsTile(
            //   title: '利用規約',
            //   leading: Icon(Icons.description),
            // ),
            SettingsTile(
              title: appLocalizations.license,
              leading: const Icon(Icons.collections_bookmark),
              onPressed: (context) {
                showLicensePage(
                  context: context,
                  applicationName: info.appName,
                  applicationVersion: info.version,
                );
              },
            ),
          ],
        ),
        SettingsSection(
          title: appLocalizations.version,
          tiles: [
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
