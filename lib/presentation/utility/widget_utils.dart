// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WidgetUtils {
  WidgetUtils._();

  static Widget loading() => const Center(
        child: const SizedBox(
          height: 100,
          width: 100,
          child: const CircularProgressIndicator(),
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

  static Widget getNoImage(BuildContext context, double imageSize) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Container(
      height: imageSize,
      width: imageSize,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
      ),
      child: Center(
        child: Text(
          appLocalizations.noImage,
        ),
      ),
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
