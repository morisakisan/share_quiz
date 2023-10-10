// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/data/repository_impl/quiz_list_repository_impl.dart';
import 'package:share_quiz/domain/usecases/user_login_use_case.dart';
import 'package:share_quiz/presentation/page/quiz_list_screen.dart';
import '../../domain/di/UseCaseModule.dart';
import '../../domain/models/quiz_list/quiz_list.dart';
import '../../domain/models/user/user_data.dart';
import '../../domain/repository/quiz_list_repository.dart';
import '../../domain/usecases/quiz_list_use_case.dart';
import '../../domain/value_object/quiz_list_order_by.dart';
import '../nav.dart';

final quizListRepositoryProvider = Provider.autoDispose<QuizListRepository>((ref) {
  return QuizListRepositoryImpl();
});

final quizListNewProvider = StreamProvider.autoDispose<QuizList>((ref) {
  var repository = ref.read(quizListRepositoryProvider);
  return QuizListUseCase(repository, QuizListOrderBy.CREATED_AT_DESC).build();
});

final quizAnswersCountListNewProvider = StreamProvider.autoDispose<QuizList>((ref) {
  var repository = ref.read(quizListRepositoryProvider);
  return QuizListUseCase(repository, QuizListOrderBy.ANSWER_COUNT_DESC).build();
});

final quizCorrectRateListNewProvider = StreamProvider.autoDispose<QuizList>((ref) {
  var repository = ref.read(quizListRepositoryProvider);
  return QuizListUseCase(repository, QuizListOrderBy.CORRECT_ANSWER_RATE_ASC).build();
});

class HomeScreen extends HookConsumerWidget {
  final _tab = [
    const Tab(text: '新着'),
    const Tab(text: '回答数'),
    const Tab(text: '正解率'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(userLoginUseCaseProvider);
    var notifier = ref.watch(userLoginUseCaseProvider.notifier);
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.app_title),
          bottom: TabBar(
            tabs: _tab,
          ),
        ),
        drawer: _createDrawer(context, state, notifier),
        body: TabBarView(
          children: [
            QuizListPage(
              quizListNewProvider,
            ),
            QuizListPage(
              quizAnswersCountListNewProvider,
            ),
            QuizListPage(
              quizCorrectRateListNewProvider,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (state is AsyncData) {
              final user = (state as AsyncData).value;
              if (user != null) {
                Navigator.of(context).pushNamed(Nav.QUIZ_POST);
              } else {
                _showLoginDialog(
                  context,
                  notifier,
                );
              }
            }
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }

  _showLoginDialog(
    BuildContext context,
    UserLoginUseCase notifier,
  ) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          content: const Text("クイズを投稿するにはログインが必要です。ログインしますか？"),
          actions: [
            // ボタン領域
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                notifier.signInWithGoogle();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _createDrawer(BuildContext context, AsyncValue<UserData?> state,
      UserLoginUseCase notifier) {
    final theme = Theme.of(context);

    Widget createHeader(Widget profile) {
      return DrawerHeader(
        child: Center(
          child: profile,
        ),
        decoration: BoxDecoration(
          color: theme.primaryColor,
        ),
      );
    }

    final List<Widget> list = [];
    if (state is AsyncLoading) {
      list.add(
        createHeader(
          const SizedBox(
            height: 50,
            width: 50,
            child: const CircularProgressIndicator(),
          ),
        ),
      );
    } else if (state is AsyncError) {
      list.add(createHeader(Column()));
    } else if (state is AsyncData) {
      final user = (state as AsyncData).value;
      if (user != null) {
        final name = user?.name ?? "";
        final photoUrl = user?.photoUrl ?? "";
        list.add(
          createHeader(
            Column(
              mainAxisSize: MainAxisSize.min,
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
                  style: theme.primaryTextTheme.headline6,
                ),
              ],
            ),
          ),
        );
      } else {
        list.add(
          createHeader(
            Text(
              "未ログインです。ログインしてください。",
              style: theme.primaryTextTheme.headline6,
            ),
          ),
        );
      }
    } else {
      throw Exception();
    }

    // list.add(
    //   ListTile(
    //     leading: Icon(Icons.account_circle),
    //     title: Text(
    //       'プロフィール',
    //       style: theme.textTheme.bodyText1,
    //     ),
    //     onTap: () {},
    //   ),
    // );

    if (state is AsyncData) {
      final user = (state as AsyncData).value;
      final Widget login;
      if (user != null) {
        login = ListTile(
          leading: const Icon(Icons.logout),
          title: Text(
            'ログアウト',
            style: theme.textTheme.bodyText1,
          ),
          onTap: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) {
                return AlertDialog(
                  content: Text("ログアウトを行います"),
                  actions: [
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        notifier.logout();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      } else {
        login = ListTile(
          leading: const Icon(Icons.login),
          title: Text(
            'ログイン',
            style: theme.textTheme.bodyText1,
          ),
          onTap: () => notifier.signInWithGoogle(),
        );
      }
      list.add(login);
    }

    list.add(
      ListTile(
        leading: const Icon(Icons.settings),
        title: Text(
          '設定',
          style: theme.textTheme.bodyText1,
        ),
        onTap: () {
          Navigator.of(context).pushNamed(Nav.SETTING);
        },
      ),
    );

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: list,
        ),
      ),
    );
  }
}
