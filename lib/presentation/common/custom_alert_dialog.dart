import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onOkPressed;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onOkPressed,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          child: Text(appLocalizations.cancel),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text(appLocalizations.ok),
          onPressed: () {
            onOkPressed();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
