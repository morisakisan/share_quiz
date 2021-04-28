import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/domain/quiz/quiz_state_notifier.dart';
import 'package:share_quiz/domain/quiz/quiz_state.dart';

class News extends HookWidget {
  final provider = StateNotifierProvider((ref) => QuizStateNotifier());

  @override
  Widget build(BuildContext context) {
    var state = useProvider(provider.select((s) => s));
    if (state is Loading) {
      return Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is Error) {
      return Text("error");
    } else {
      final list = (state as Success).quiz;
      final widgets = list.map((value) {
        return Card(
            margin: EdgeInsets.only(bottom: 16.0),
            child: Column(
              children: [
                Ink.image(
                  image: NetworkImage(value.imageUrl!),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Text(
                  value.title,
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 12),
                Text(
                  value.question,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 12),
              ],
            ));
      }).toList();
      return ListView(
        children: widgets,
        padding: EdgeInsets.all(16.0),
      );
    }
  }
}
