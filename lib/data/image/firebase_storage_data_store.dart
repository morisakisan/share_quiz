import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageDataStore {
  Future<String?> uploadFile(File? file) async {
    if (file == null) {
      return null;
    }
    final ref = FirebaseStorage.instance
        .ref()
        .child('playground')
        .child('/some-image.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );

    UploadTask uploadTask;
    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(File(file.path), metadata);
    }
    return uploadTask.snapshot.ref.getDownloadURL();
  }
}
