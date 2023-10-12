// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/data/repository_impl/quiz_list_repository_impl.dart';
import 'package:share_quiz/domain/usecases/user_login_use_case.dart';
import 'package:share_quiz/presentation/page/quiz_list_page.dart';
import 'package:share_quiz/presentation/utility/FirebaseErrorHandler.dart';
import '../../domain/di/UseCaseModule.dart';
import '../../domain/models/quiz_list/quiz_list.dart';
import '../../domain/models/user/user_data.dart';
import '../../domain/repository/quiz_list_repository.dart';
import '../../domain/usecases/quiz_list_use_case.dart';
import '../../domain/value_object/quiz_list_order_by.dart';
import '../nav.dart';

final quizListRepositoryProvider =
    Provider.autoDispose<QuizListRepository>((ref) {
  return QuizListRepositoryImpl();
});

final quizListNewProvider = StreamProvider.autoDispose<QuizList>((ref) {
  var repository = ref.read(quizListRepositoryProvider);
  return QuizListUseCase(repository, QuizListOrderBy.CREATED_AT_DESC).build();
});

final quizAnswersCountListNewProvider =
    StreamProvider.autoDispose<QuizList>((ref) {
  var repository = ref.read(quizListRepositoryProvider);
  return QuizListUseCase(repository, QuizListOrderBy.ANSWER_COUNT_DESC).build();
});

final quizCorrectRateListNewProvider =
    StreamProvider.autoDispose<QuizList>((ref) {
  var repository = ref.read(quizListRepositoryProvider);
  return QuizListUseCase(repository, QuizListOrderBy.CORRECT_ANSWER_RATE_ASC)
      .build();
});

class HomeScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final tab = [
      Tab(text: appLocalizations.new_arrivals),
      Tab(text: appLocalizations.answer_count),
      Tab(text: appLocalizations.correct_rate),
    ];

    var state = ref.watch(userLoginUseCaseProvider);
    var notifier = ref.watch(userLoginUseCaseProvider.notifier);
    return DefaultTabController(
      length: tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocalizations.app_title),
          bottom: TabBar(
            tabs: tab,
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
            } else if (state is AsyncError) {
              FirebaseErrorHandler.showErrorDialog(context, state.error);
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
    final appLocalizations = AppLocalizations.of(context)!;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Text(appLocalizations.login_required_to_post),
          actions: [
            // ボタン領域
            TextButton(
              child: Text(appLocalizations.cancel),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text(appLocalizations.ok),
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
    final appLocalizations = AppLocalizations.of(context)!;
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
      list.add(
          createHeader(Text(FirebaseErrorHandler.getMessage(state.error))));
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
              appLocalizations.please_login,
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
            appLocalizations.logout,
            style: theme.textTheme.bodyText1,
          ),
          onTap: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) {
                return AlertDialog(
                  content: Text(appLocalizations.confirm_logout),
                  actions: [
                    TextButton(
                      child: Text(appLocalizations.cancel),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: Text(appLocalizations.ok),
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
            appLocalizations.login,
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
          appLocalizations.settings,
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
