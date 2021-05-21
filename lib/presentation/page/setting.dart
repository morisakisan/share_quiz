import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:settings_ui/settings_ui.dart';

class Setting extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
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
                showLicensePage(context: context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
