// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../provider/login_use_case_provider.dart';
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
