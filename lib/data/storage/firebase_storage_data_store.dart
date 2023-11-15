// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:crypto/crypto.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageDataStore {

  Future<String?> uploadFile(File? file, String userId) async {
    if (file == null) {
      return null;
    }

    final value = await sha256.bind(file.openRead()).first;

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

  Future<void> deleteFileFromURL(String fileUrl) async {
    // URLからファイルパスを抽出
    Uri fileUri = Uri.parse(fileUrl);
    String filePath = fileUri.pathSegments.last;

    // Firebase Storageの参照を取得
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(filePath);

    // ファイルを削除
    await ref.delete();
  }
}