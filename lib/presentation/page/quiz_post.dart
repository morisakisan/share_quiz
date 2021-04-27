
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_quiz/presentation/widget/image_form_field.dart';

class QuizPost extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  String? _title;
  String? _description;
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('クイズを入力してね'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "タイトル",
                  hintText: 'タイトル入れてね。',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '文字がはいってないよ。';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "詳細",
                    hintText: '詳細を入れてね。',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '文字がはいってないよ。';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ImageFormField(
                  onSaved: (value) {
                    _image = value as File?;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    // 入力データが正常な場合の処理
                    _formKey.currentState!.save();
                    Navigator.pop(context);
                  },
                  child: Text('送信'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}