// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:share_quiz/presentation/utility/error_handler.dart';

class ErrorDialog extends StatelessWidget {
  final Object? e;
  final StackTrace stackTrace;

  ErrorDialog(this.e, this.stackTrace, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('エラー'),
      content: Text(ErrorHandler.getMessage(e, stackTrace)),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

}
