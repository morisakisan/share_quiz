// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/domain/common/resource.dart';
import 'package:share_quiz/domain/quiz_post/quiz_post_data.dart';
import 'package:share_quiz/domain/quiz_post/quiz_post_state_notifer.dart';
import 'package:share_quiz/presentation/widget/choices_form_field.dart';
import 'package:share_quiz/presentation/widget/image_form_field.dart';

class QuizPost extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  String? _title;
  String? _question;
  File? _image;
  List<String>? _choices;
  int? _answer;

  final provider = StateNotifierProvider((ref) => QuizPostStateNotifier());

  @override
  Widget build(BuildContext context) {
    final state = useProvider(provider.select((s) => s));

    final List<Widget> children = [
      SingleChildScrollView(
        child: _form(context),
      )
    ];
    if (state is Loading) {
      children.add(_loading());
    } else if (state is Error) {
    } else if (state is Success) {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('クイズを入力してね'),
      ),
      body: Stack(
        children: children,
      ),
    );
  }

  Widget _form(BuildContext context) {
    final notifier = useProvider(provider.notifier);
    return Container(
      margin: EdgeInsets.all(16.0),
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
                notifier.post(postData);
              },
              child: Text('クイズを投稿する'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loading() {
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
