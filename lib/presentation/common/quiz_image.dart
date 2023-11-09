// Flutter imports:
import 'package:flutter/material.dart';

class QuizImage extends StatelessWidget {
  final double imageSize;
  final String imageUrl;

  const QuizImage({
    super.key,
    required this.imageSize,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
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
