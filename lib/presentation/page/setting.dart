import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:package_info/package_info.dart';

class Setting extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          return _buildSettingsList(snapshot.data!);
        },
      ),
    );
  }

  Widget _buildSettingsList(PackageInfo info) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: 'その他',
          titlePadding: EdgeInsets.only(
            top: 12,
            left: 15.0,
            right: 15.0,
            bottom: 6.0,
          ),
          tiles: [
            SettingsTile(
              title: '利用規約',
              leading: Icon(Icons.description),
            ),
            SettingsTile(
              title: 'ライセンス',
              leading: Icon(Icons.collections_bookmark),
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
          title: 'バージョン',
          tiles: [
            SettingsTile(
              title: 'バージョン',
              leading: Icon(Icons.info_outline),
              trailing: Text(info.version),
            ),
          ],
        ),
      ],
    );
  }
}
