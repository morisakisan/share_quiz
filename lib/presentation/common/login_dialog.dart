import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repository_impl/login_repository_impl.dart';
import '../../domain/repository/login_repository.dart';
import '../../domain/use_cases/login_use_case.dart';

final _loginRepositoryProvider = Provider.autoDispose<LoginRepository>((ref) {
  return LoginRepositoryImpl();
});

final _loginUseCaseProvider =
    StateNotifierProvider.autoDispose<LoginUseCase, AsyncValue<void>>((ref) {
  var repository = ref.read(_loginRepositoryProvider);
  return LoginUseCase(repository);
});

class LoginDialog extends HookConsumerWidget {
  final String contentText;

  const LoginDialog(this.contentText, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loginUseCase = ref.read(_loginUseCaseProvider.notifier);
    final appLocalizations = AppLocalizations.of(context)!;
    return AlertDialog(
      content: Text(contentText),
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
            loginUseCase.signInWithGoogle();
          },
        ),
      ],
    );
  }
}
