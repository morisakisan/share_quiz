import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Home extends HookWidget {
  final _tab = <Tab>[
    Tab(text: '新着'),
    Tab(text: 'トレンド'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
            title: Text('クイズシェア'),
            bottom: TabBar(
              tabs: _tab,
            )),
        drawer: _createDrawer(),
        body: TabBarView(
          children: [
            Text('Car'),
            Text('Car'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            backgroundColor: Colors.green),
      ),
    );
  }

  Drawer _createDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(children: [
              Text(
                "シンゴ",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                radius: 30.0,
                // backgroundImage:
                // NetworkImage(photoUrl),
                backgroundColor: Colors.transparent,
              )
            ]),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('プロフィール'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('設定'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('プライバシーポリシー'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('ライセンス'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('ログアウト'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
