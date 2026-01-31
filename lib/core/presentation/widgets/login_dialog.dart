// Flutter imports:
import 'package:flutter/material.dart';
import 'package:share_quiz/core/presentation/providers/login_use_case_provider.dart';

// Package imports:
import 'package:share_quiz/generated/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'custom_alert_dialog.dart';

class LoginDialog extends HookConsumerWidget {
  final String contentText;

  const LoginDialog(this.contentText, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loginUseCase = ref.watch(loginUseCaseProvider.notifier);
    final appLocalizations = AppLocalizations.of(context)!;
    return CustomAlertDialog(
      title: appLocalizations.login,
      message: contentText,
      onOkPressed: () {
        loginUseCase.signInWithGoogle();
      },
    );
  }
}
