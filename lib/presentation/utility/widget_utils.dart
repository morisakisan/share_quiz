// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WidgetUtils {
  WidgetUtils._();

  static Widget loading() => const Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(),
        ),
      );

  static Widget loadingScreen(BuildContext context) {
    return Container(
      color: Theme
          .of(context)
          .dialogBackgroundColor,
      child: loading(),
    );
  }

  static Widget getQuizImage(double imageSize, String imageUrl) {
    return Hero(
      tag: imageUrl,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        height: imageSize,
        width: imageSize,
      ),
    );
  }
}
