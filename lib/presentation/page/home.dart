import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_quiz/domain/user/user_state.dart';
import 'package:share_quiz/domain/user/user_state_notifier.dart';
import 'package:share_quiz/presentation/screen/news.dart';
import 'package:share_quiz/presentation/screen/trend.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
            News(),
            Trend(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            backgroundColor: Colors.green),
      ),
    );
  }

  final provider = StateNotifierProvider((ref) => UserStateNotifier());

  Drawer _createDrawer() {

    UserState state = useProvider(provider.select((s) => s));

    //一旦無理やり
    if (state is Loading) {
      return Drawer();
    }

    final user = (state as Success).user;

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(children: [
              Text(
                user.name,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(user.photoUrl),
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
