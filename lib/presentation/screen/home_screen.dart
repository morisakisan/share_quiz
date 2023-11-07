// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/data/repository_impl/current_login_repository_impl.dart';
import 'package:share_quiz/data/repository_impl/quiz_list_repository_impl.dart';
import 'package:share_quiz/domain/repository/current_login_repository.dart';
import 'package:share_quiz/domain/use_cases/current_login_use_case.dart';
import 'package:share_quiz/domain/use_cases/login_use_case.dart';
import 'package:share_quiz/presentation/page/quiz_list_page.dart';
import 'package:share_quiz/presentation/utility/error_handler.dart';
import '../../data/repository_impl/log_out_repository_impl.dart';
import '../../data/repository_impl/login_repository_impl.dart';
import '../../domain/models/quiz_list/quiz_list.dart';
import '../../domain/models/user/user_data.dart';
import '../../domain/repository/log_out_repository.dart';
import '../../domain/repository/login_repository.dart';
import '../../domain/use_cases/log_out_use_case.dart';
import '../../domain/use_cases/quiz_list_use_case.dart';
import '../../domain/value_object/quiz_list_order_by.dart';
import '../common/login_dialog.dart';
import '../nav.dart';
import '../utility/widget_utils.dart';

import 'package:share_quiz/provider/quiz_list_repository_provider.dart';

final _quizNewListProvider = StreamProvider.autoDispose<QuizList>((ref) {
  var repository = ref.read(quizListRepositoryProvider);
  return QuizListUseCase(repository, QuizListOrderBy.createdAtDesc).build();
});

final _quizAnswersCountListNewProvider =
    StreamProvider.autoDispose<QuizList>((ref) {
  var repository = ref.read(quizListRepositoryProvider);
  return QuizListUseCase(repository, QuizListOrderBy.answerCountDesc).build();
});

final _quizCorrectRateListNewProvider =
    StreamProvider.autoDispose<QuizList>((ref) {
  var repository = ref.read(quizListRepositoryProvider);
  return QuizListUseCase(repository, QuizListOrderBy.correctAnswerRateAsc)
      .build();
});

final _currentUserRepositoryProvider =
    Provider.autoDispose<CurrentLoginRepository>((ref) {
  return CurrentLoginRepositoryImpl();
});

final _currentUserProvider = StreamProvider.autoDispose<UserData?>((ref) {
  var repository = ref.read(_currentUserRepositoryProvider);
  return CurrentLoginUseCase(repository).build();
});

final _loginRepositoryProvider = Provider.autoDispose<LoginRepository>((ref) {
  return LoginRepositoryImpl();
});

final _loginUseCaseProvider =
    StateNotifierProvider.autoDispose<LoginUseCase, AsyncValue<void>>((ref) {
  var repository = ref.read(_loginRepositoryProvider);
  return LoginUseCase(repository);
});

final _logOutRepositoryProvider = Provider.autoDispose<LogOutRepository>((ref) {
  return LogOutRepositoryImpl();
});

final _logOutUseCaseProvider =
    StateNotifierProvider.autoDispose<LogOutUseCase, AsyncValue<void>>((ref) {
  var repository = ref.read(_logOutRepositoryProvider);
  return LogOutUseCase(repository);
});

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

    var currentUser = ref.watch(_currentUserProvider);

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
            QuizListPage(_quizNewListProvider),
            QuizListPage(_quizAnswersCountListNewProvider),
            QuizListPage(_quizCorrectRateListNewProvider),
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

    var login = ref.watch(_loginUseCaseProvider);

    var logout = ref.watch(_logOutUseCaseProvider);
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
    var loginUseCase = ref.read(_loginUseCaseProvider.notifier);
    var logOutUseCase = ref.read(_logOutUseCaseProvider.notifier);
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
