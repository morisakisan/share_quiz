import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_quiz/domain/common/resource.dart';
import 'package:share_quiz/domain/user/user_data.dart';
import 'package:share_quiz/domain/user_login/user_login_state_notifier.dart';
import 'package:share_quiz/presentation/screen/news.dart';
import 'package:share_quiz/presentation/screen/ranking.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../nav.dart';

class Home extends HookWidget {
  final _tab = <Tab>[
    Tab(text: '新着'),
    Tab(text: 'ランキング'),
  ];

  final provider = StateNotifierProvider((ref) => UserLoginStateNotifier());

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
        drawer: _createDrawer(context, state, notifier),
        body: TabBarView(
          children: [
            News(),
            Ranking(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (state is Success) {
              final user = state.value;
              if (user != null) {
                Navigator.of(context).pushNamed(Nav.QUIZ_POST);
              } else {
                notifier.signInWithGoogle();
              }
            }
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }

  Drawer _createDrawer(BuildContext context, Resource<UserData?> state,
      UserLoginStateNotifier notifier) {
    final theme = Theme.of(context);
    final Widget profile;
    if (state is Loading) {
      profile = Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is Error) {
      profile = Column();
    } else if (state is Success) {
      final user = (state as Success).value;
      if (user != null) {
        final name = user?.name ?? "";
        final photoUrl = user?.photoUrl ?? "";
        profile = Column(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(photoUrl),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              name,
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ],
        );
      } else {
        profile = Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              "未ログインです。ログインしてください。",
              style: Theme.of(context).primaryTextTheme.headline6,
            )
          ],
        );
      }
    } else {
      throw Exception();
    }

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: profile,
            decoration: BoxDecoration(
              color: theme.primaryColor,
            ),
          ),
          ListTile(
            title: Text(
              'プロフィール',
              style: theme.textTheme.bodyText1,
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              '設定',
              style: theme.textTheme.bodyText1,
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              'プライバシーポリシー',
              style: theme.textTheme.bodyText1,
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              'ライセンス',
              style: theme.textTheme.bodyText1,
            ),
            onTap: () {
              showLicensePage(context: context);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'ログアウト',
              style: theme.textTheme.bodyText1,
            ),
            onTap: () {
              notifier.logout();
            },
          ),
        ],
      ),
    );
  }
}
