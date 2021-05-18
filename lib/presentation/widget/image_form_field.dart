import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageFormField extends FormField<File> {
  ImageFormField({FormFieldSetter<File>? onSaved})
      : super(
          onSaved: onSaved,
          builder: (FormFieldState<File> state) {
            Widget widget;
            if (state.value != null) {
              widget = Image.file(
                File(state.value!.path),
                width: 150,
                height: 150,
                fit: BoxFit.cover
              );
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
                        _pickImage(ImageSource.camera, state);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.photo_album),
                      onPressed: () {
                        _pickImage(ImageSource.gallery, state);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        state.didChange(null);
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        );

  static _pickImage(ImageSource source, FormFieldState<File> state) async {
    final pickedFile = await ImagePicker().getImage(
      source: source,
      maxWidth: 1024,
      maxHeight: 1024,
    );
    // ignore: unnecessary_null_comparison
    if (pickedFile == null) {
      return;
    }
    state.didChange(File(pickedFile.path));
  }
}
