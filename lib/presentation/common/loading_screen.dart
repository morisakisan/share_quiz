// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'loading.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).dialogTheme.backgroundColor,
      child: const Loading(),
    );
  }
}
