// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/domain/usecases/quiz_post_use_case.dart';
import 'package:share_quiz/presentation/widget/form/choices_form_field.dart';
import 'package:share_quiz/presentation/widget/form/image_form_field.dart';
import 'package:share_quiz/presentation/widget/widget_utils.dart';

import '../../domain/models/quiz_post/quiz_post_data.dart';

class QuizPost extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  String? _title;
  String? _question;
  File? _image;
  List<String>? _choices;
  int? _answer;

  final postNotifierProvider =
      StateNotifierProvider<QuizPostUseCase, AsyncValue<Object?>?>((ref) {
    return QuizPostUseCase();
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(postNotifierProvider);
    final List<Widget> children = [
      SingleChildScrollView(
        child: _form(context, ref),
      )
    ];
    if (postState is AsyncLoading) {
      children.add(WidgetUtils.loading());
    } else if (postState is AsyncError) {

    } else if (postState is AsyncData) {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('クイズを入力してね'),
      ),
      body: Stack(
        children: children,
      ),
    );
  }

  Widget _form(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: "タイトル",
                hintText: 'タイトルを入れてね',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'タイトルがはいってないよ';
                }
                return null;
              },
              onSaved: (value) {
                _title = value;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: 100,
              decoration: const InputDecoration(
                labelText: "問題文",
                hintText: '問題文を入れてね',
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '問題文がはいってないよ';
                }
                return null;
              },
              onSaved: (value) {
                _question = value;
              },
            ),
            const SizedBox(height: 16),
            ImageFormField(
              onSaved: (value) {
                _image = value;
              },
            ),
            const SizedBox(height: 16),
            ChoicesFormField(
              context,
              onSaved: (value) {
                _choices = value!.item1;
                _answer = value.item2;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                // 入力データが正常な場合の処理
                _formKey.currentState!.save();
                final postData = QuizPostData(
                  title: _title!,
                  question: _question!,
                  choices: _choices!,
                  answer: _answer!,
                  imageFile: _image,
                );
                ref.read(postNotifierProvider.notifier).post(postData);
              },
              child: const Text('クイズを投稿する'),
            ),
          ],
        ),
      ),
    );
  }
}