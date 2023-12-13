// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';

class ImageFormField extends FormField<XFile> {
  ImageFormField({super.key, super.onSaved})
      : super(
          builder: (FormFieldState<XFile> state) {
            final appLocalizations = AppLocalizations.of(state.context)!;
            final icons = [
              IconButton(
                icon: const Icon(Icons.photo_camera),
                onPressed: () {
                  _pickImage(ImageSource.camera, state);
                },
              ),
              IconButton(
                icon: const Icon(Icons.photo_album),
                onPressed: () {
                  _pickImage(ImageSource.gallery, state);
                },
              ),
            ];
            final List<Widget> children = [
              Text(
                appLocalizations.image,
              ),
            ];
            if (state.value != null) {
              children.add(
                const SizedBox(
                  height: 16,
                ),
              );
              Widget widget = Image.network(state.value!.path,
                  width: 150, height: 150, fit: BoxFit.cover);
              children.add(widget);
              icons.add(
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    state.didChange(null);
                  },
                ),
              );
            }
            children.add(
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: icons,
              ),
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            );
          },
        );

  static _pickImage(ImageSource source, FormFieldState<XFile> state) async {
    final pickedFile = await ImagePickerPlugin().getImage(
      source: source,
      maxWidth: 1024,
      maxHeight: 1024,
    );
    // ignore: unnecessary_null_comparison
    if (pickedFile == null) {
      return;
    }
    state.didChange(pickedFile);
  }
}
