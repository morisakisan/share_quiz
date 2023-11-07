// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../domain/models/user/user_data.dart';
import '../../provider/current_user_provider.dart';
import '../../provider/log_out_use_case_provider.dart';
import '../../provider/login_use_case_provider.dart';
import '../../provider/quiz_answers_count_list_provider.dart';
import '../../provider/quiz_correct_rate_list_provider.dart';
import '../../provider/quiz_new_list_provider.dart';
import '../common/login_dialog.dart';
import '../nav.dart';
import '../page/quiz_list_page.dart';
import '../utility/error_handler.dart';
import '../utility/widget_utils.dart';

// Project imports:


class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final tab = [
      Tab(text: appLocalizations.new_arrivals),
      Tab(text: appLocalizations.answer_count),
      Tab(text: appLocalizations.correct_rate),
    ];

    var currentUser = ref.watch(currentUserProvider);

    List<Widget> stackChildren = [];

    stackChildren.add(DefaultTabController(
      length: tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocalizations.app_title),
          bottom: TabBar(
            tabs: tab,
          ),
        ),
        drawer: _HomeDrawer(currentUser),
        body: TabBarView(
          children: [
            QuizListPage(quizNewListProvider),
            QuizListPage(quizAnswersCountListProvider),
            QuizListPage(quizCorrectRateListProvider),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (currentUser is AsyncData) {
              final user = (currentUser as AsyncData).value;
              if (user != null) {
                Navigator.of(context).pushNamed(Nav.quizPost);
              } else {
                _showLoginDialog(context);
              }
            } else if (currentUser is AsyncError) {
              var error = currentUser as AsyncError;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ErrorHandler.showErrorDialog(
                    context, error.error, error.stackTrace);
              });
            }
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
      ),
    ));

    var login = ref.watch(loginUseCaseProvider);

    var logout = ref.watch(logOutUseCaseProvider);
    if (login is AsyncLoading || logout is AsyncLoading) {
      stackChildren.add(WidgetUtils.loading());
    } else if (login is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ErrorHandler.showErrorDialog(context, login.error, login.stackTrace);
      });
    } else if (logout is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ErrorHandler.showErrorDialog(context, logout.error, logout.stackTrace);
      });
    }

    return Stack(children: stackChildren);
  }

  _showLoginDialog(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return LoginDialog(appLocalizations.login_required_to_post);
      },
    );
  }
}

class _HomeDrawer extends HookConsumerWidget {
  final AsyncValue<UserData?> _state;

  const _HomeDrawer(this._state);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loginUseCase = ref.read(loginUseCaseProvider.notifier);
    var logOutUseCase = ref.read(logOutUseCaseProvider.notifier);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    Widget createHeader(Widget profile) {
      return DrawerHeader(
        decoration: BoxDecoration(
          color: theme.primaryColor,
        ),
        child: Center(
          child: profile,
        ),
      );
    }

    final List<Widget> list = [];
    if (_state is AsyncLoading) {
      list.add(
        createHeader(
          const SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else if (_state is AsyncError) {
      var error = _state as AsyncError;
      list.add(createHeader(
          Text(ErrorHandler.getMessage(_state.error, error.stackTrace))));
    } else if (_state is AsyncData) {
      final user = (_state as AsyncData).value;
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
                const SizedBox(
                  height: 16,
                ),
                Text(
                  name,
                  style: theme.primaryTextTheme.titleLarge,
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
              style: theme.primaryTextTheme.titleLarge,
            ),
          ),
        );
      }
    } else {
      throw Exception();
    }

    if (_state is AsyncData) {
      final user = (_state as AsyncData).value;
      if (user != null) {
        list.add(
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text(
              'プロフィール',
              style: theme.textTheme.bodyLarge,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(Nav.profile);
            },
          ),
        );
        final logout = ListTile(
          leading: const Icon(Icons.logout),
          title: Text(
            appLocalizations.logout,
            style: theme.textTheme.bodyLarge,
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
                        logOutUseCase.logout();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
        list.add(logout);
      } else {
        final login = ListTile(
          leading: const Icon(Icons.login),
          title: Text(
            appLocalizations.login,
            style: theme.textTheme.bodyLarge,
          ),
          onTap: () => loginUseCase.signInWithGoogle(),
        );
        list.add(login);
      }
    }

    list.add(
      ListTile(
        leading: const Icon(Icons.settings),
        title: Text(
          appLocalizations.settings,
          style: theme.textTheme.bodyLarge,
        ),
        onTap: () {
          Navigator.of(context).pushNamed(Nav.setting);
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
