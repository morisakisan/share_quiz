// Flutter imports:
import 'package:flutter/material.dart';

class WidgetUtils {
  WidgetUtils._();

  static Widget loading() => const Center(
        child: const SizedBox(
          height: 100,
          width: 100,
          child: const CircularProgressIndicator(),
        ),
      );
}
