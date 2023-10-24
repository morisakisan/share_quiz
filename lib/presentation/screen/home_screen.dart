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
import 'package:share_quiz/presentation/utility/firebase_error_handler.dart';
import '../../data/repository_impl/log_out_repository_impl.dart';
import '../../data/repository_impl/login_repository_impl.dart';
import '../../domain/models/quiz_list/quiz_list.dart';
import '../../domain/models/user/user_data.dart';
import '../../domain/repository/log_out_repository.dart';
import '../../domain/repository/login_repository.dart';
import '../../domain/repository/quiz_list_repository.dart';
import '../../domain/use_cases/log_out_use_case.dart';
import '../../domain/use_cases/quiz_list_use_case.dart';
import '../../domain/value_object/quiz_list_order_by.dart';
import '../nav.dart';

final _quizListRepositoryProvider =
    Provider.autoDispose<QuizListRepository>((ref) {
  return QuizListRepositoryImpl();
});

final _quizListNewProvider = StreamProvider.autoDispose<QuizList>((ref) {
  var repository = ref.read(_quizListRepositoryProvider);
  return QuizListUseCase(repository, QuizListOrderBy.CREATED_AT_DESC).build();
});

final _quizAnswersCountListNewProvider =
    StreamProvider.autoDispose<QuizList>((ref) {
  var repository = ref.read(_quizListRepositoryProvider);
  return QuizListUseCase(repository, QuizListOrderBy.ANSWER_COUNT_DESC).build();
});

final _quizCorrectRateListNewProvider =
    StreamProvider.autoDispose<QuizList>((ref) {
  var repository = ref.read(_quizListRepositoryProvider);
  return QuizListUseCase(repository, QuizListOrderBy.CORRECT_ANSWER_RATE_ASC)
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
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final tab = [
      Tab(text: appLocalizations.new_arrivals),
      Tab(text: appLocalizations.answer_count),
      Tab(text: appLocalizations.correct_rate),
    ];

    var currentUser = ref.watch(_currentUserProvider);
    var loginUseCase = ref.watch(_loginUseCaseProvider.notifier);
    var logOutUseCase = ref.watch(_logOutUseCaseProvider.notifier);

    return DefaultTabController(
      length: tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocalizations.app_title),
          bottom: TabBar(
            tabs: tab,
          ),
        ),
        drawer: _createDrawer(context, currentUser, loginUseCase, logOutUseCase),
        body: TabBarView(
          children: [
            QuizListPage(
              _quizListNewProvider,
            ),
            QuizListPage(
              _quizAnswersCountListNewProvider,
            ),
            QuizListPage(
              _quizCorrectRateListNewProvider,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (currentUser is AsyncData) {
              final user = (currentUser as AsyncData).value;
              if (user != null) {
                Navigator.of(context).pushNamed(Nav.QUIZ_POST);
              } else {
                _showLoginDialog(
                  context,
                  loginUseCase,
                );
              }
            } else if (currentUser is AsyncError) {
              var error = currentUser as AsyncError;
              FirebaseErrorHandler.showErrorDialog(
                  context, error.error, error.stackTrace);
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
    LoginUseCase notifier,
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
      LoginUseCase loginUseCase, LogOutUseCase logOutUseCase) {
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
      var error = state as AsyncError;
      list.add(createHeader(Text(
          FirebaseErrorHandler.getMessage(state.error, error.stackTrace))));
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

    if (state is AsyncData) {
      final user = (state as AsyncData).value;
      if (user != null) {
        list.add(
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
              'プロフィール',
              style: theme.textTheme.bodyText1,
            ),
            onTap: () {},
          ),
        );
        final login = ListTile(
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
        list.add(login);
      } else {
        final login = ListTile(
          leading: const Icon(Icons.login),
          title: Text(
            appLocalizations.login,
            style: theme.textTheme.bodyText1,
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
