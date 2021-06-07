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

  static Widget getNoImage(double imageSize) => Container(
        height: imageSize,
        width: imageSize,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
        ),
        child: Center(
          child: const Text(
            "No image",
          ),
        ),
      );

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
