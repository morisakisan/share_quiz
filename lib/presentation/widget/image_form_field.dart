import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageFormField extends FormField<File> {
  ImageFormField({FormFieldSetter<File>? onSaved})
      : super(
          onSaved: onSaved,
          builder: (FormFieldState<File> state) {
            pickImage(ImageSource source) async {
              final pickedFile = await ImagePicker().getImage(source: source);
              // ignore: unnecessary_null_comparison
              if (pickedFile == null) {
                return;
              }
              state.didChange(File(pickedFile.path));
            }

            Widget widget;
            if (state.value != null) {
              widget = Image.file(File(state.value!.path));
            } else {
              widget = Text("画像を選んでね");
            }

            return Column(
              children: <Widget>[
                widget,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.photo_camera),
                      onPressed: () {
                        pickImage(ImageSource.camera);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.photo_album),
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                      },
                    ),
                  ],
                )
              ],
            );
          },
        );
}
