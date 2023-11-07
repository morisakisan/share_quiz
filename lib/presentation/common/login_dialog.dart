import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repository_impl/login_repository_impl.dart';
import '../../domain/repository/login_repository.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../provider/login_use_case_provider.dart';

class LoginDialog extends HookConsumerWidget {
  final String contentText;

  const LoginDialog(this.contentText, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loginUseCase = ref.watch(loginUseCaseProvider.notifier);
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
