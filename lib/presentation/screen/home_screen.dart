// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/presentation/common/loading_screen.dart';
import '../../domain/models/user/user_data.dart';
import '../../provider/current_user_provider.dart';
import '../../provider/log_out_use_case_provider.dart';
import '../../provider/login_use_case_provider.dart';
import '../../provider/quiz_list_answers_count_provider.dart';
import '../../provider/quiz_list_correct_rate_provider.dart';
import '../../provider/quiz_list_good_count.dart';
import '../../provider/quiz_list_new_provider.dart';
import '../common/custom_alert_dialog.dart';
import '../common/login_dialog.dart';
import '../nav.dart';
import '../page/quiz_list_page.dart';
import '../utility/error_handler.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final tab = [
      Tab(text: appLocalizations.new_arrivals),
      Tab(text: appLocalizations.good_count),
      Tab(text: appLocalizations.answer_count),
      Tab(text: appLocalizations.correct_rate),
    ];

    var currentUser = ref.watch(currentUserProvider);

    List<Widget> stackChildren = [];

    stackChildren.add(
      DefaultTabController(
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
              QuizListPage(quizListNewProvider),
              QuizListPage(quizListGoodCountProvider),
              QuizListPage(quizListAnswersCountProvider),
              QuizListPage(quizListCorrectRateProvider),
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
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    ErrorHandler.showErrorDialog(
                        context, error.error, error.stackTrace);
                  },
                );
              }
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );

    var login = ref.watch(loginUseCaseProvider);

    var logout = ref.watch(logOutUseCaseProvider);
    if (login is AsyncLoading || logout is AsyncLoading) {
      stackChildren.add(const LoadingScreen());
    } else if (login is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ErrorHandler.showErrorDialog(context, login.error, login.stackTrace);
        },
      );
    } else if (logout is AsyncError) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ErrorHandler.showErrorDialog(
              context, logout.error, logout.stackTrace);
        },
      );
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
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            _HomeDrawerHeader(state: _state),
            if (_state.value != null) ...[
              const _ProfileTile(),
              const _LogoutTile(),
            ],
            if (_state.value == null) const _LoginTile(),
            const _SettingsTile(),
          ],
        ),
      ),
    );
  }
}

class _HomeDrawerHeader extends StatelessWidget {
  final AsyncValue<UserData?> state;

  const _HomeDrawerHeader({required this.state});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget content;

    if (state is AsyncLoading) {
      content = const CircularProgressIndicator();
    } else if (state is AsyncError) {
      content = Text(ErrorHandler.getMessage(
          state.error, (state as AsyncError).stackTrace));
    } else if (state is AsyncData<UserData?> && state.value != null) {
      content = _UserHeaderContent(user: state.value!);
    } else {
      content = Text(AppLocalizations.of(context)!.please_login,
          style: theme.primaryTextTheme.titleLarge);
    }

    return DrawerHeader(
      decoration: BoxDecoration(color: theme.appBarTheme.backgroundColor),
      child: Center(child: content),
    );
  }
}

class _UserHeaderContent extends StatelessWidget {
  final UserData user;

  const _UserHeaderContent({required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(user.photoUrl ?? ""),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(height: 16),
        Text(user.name ?? "", style: theme.primaryTextTheme.titleLarge),
      ],
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: const Icon(Icons.account_circle),
      title: Text('プロフィール', style: theme.textTheme.bodyLarge),
      onTap: () => Navigator.of(context).pushNamed(Nav.profile),
    );
  }
}

class _LogoutTile extends HookConsumerWidget {
  const _LogoutTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return ListTile(
      leading: const Icon(Icons.logout),
      title: Text(appLocalizations.logout, style: theme.textTheme.bodyLarge),
      onTap: () => _showLogoutDialog(context, ref),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context)!;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => CustomAlertDialog(
        title: appLocalizations.logout,
        message: appLocalizations.confirm_logout,
        onOkPressed: () {
          ref.read(logOutUseCaseProvider.notifier).logout();
        },
      ),
    );
  }
}

class _LoginTile extends HookConsumerWidget {
  const _LoginTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    return ListTile(
      leading: const Icon(Icons.login),
      title: Text(appLocalizations.login, style: theme.textTheme.bodyLarge),
      onTap: () => ref.read(loginUseCaseProvider.notifier).signInWithGoogle(),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile();

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return ListTile(
      leading: const Icon(Icons.settings),
      title: Text(appLocalizations.settings, style: theme.textTheme.bodyLarge),
      onTap: () => Navigator.of(context).pushNamed(Nav.setting),
    );
  }
}
