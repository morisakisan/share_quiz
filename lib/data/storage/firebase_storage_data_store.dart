// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:crypto/crypto.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageDataStore {

  Future<String?> uploadFile(File? file) async {
    if (file == null) {
      return null;
    }

    final value = await sha256.bind(file.openRead()).first;

    // ユーザーのUIDを取得
    final userId = FirebaseAuth.instance.currentUser!.uid;

    // UIDを参照の一部として使用
    final ref = FirebaseStorage.instance
        .ref()
        .child('$userId/$value.jpg');

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
    await uploadTask.whenComplete(() {});
    return uploadTask.snapshot.ref.getDownloadURL();
  }
}
