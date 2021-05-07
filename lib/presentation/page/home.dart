import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_quiz/domain/user/user_state.dart';
import 'package:share_quiz/domain/user/user_state_notifier.dart';
import 'package:share_quiz/presentation/screen/news.dart';
import 'package:share_quiz/presentation/screen/ranking.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../nav.dart';

class Home extends HookWidget {
  final _tab = <Tab>[
    Tab(text: '新着'),
    Tab(text: 'ランキング'),
  ];

  final provider = StateNotifierProvider((ref) => UserStateNotifier());

  @override
  Widget build(BuildContext context) {
    var state = useProvider(provider.select((s) => s));
    var notifier = useProvider(provider.notifier);
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ShareQuiz'),
          bottom: TabBar(
            tabs: _tab,
          ),
        ),
        drawer: _createDrawer(context, state),
        body: TabBarView(
          children: [
            News(),
            Ranking(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (state is Success) {
              final user = state.user;
              if (user != null) {
                Navigator.of(context).pushNamed(Nav.QUIZ_POST);
              } else {
                notifier.signInGoogle();
              }
            }
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }

  Drawer _createDrawer(BuildContext context, UserState state) {
    //一旦無理やり
    if (state is Loading) {
      return Drawer();
    }

    final user = (state as Success).user;
    final name = user?.name ?? "";
    final photoUrl = user?.photoUrl ?? "";

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(photoUrl),
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
            onTap: () {
              showLicensePage(context: context);
            },
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
