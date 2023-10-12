// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler {
  FirebaseErrorHandler._();

  static String getMessage(Object? e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'account-exists-with-different-credential':
          return '異なる認証情報でアカウントが存在します。';
        case 'invalid-credential':
          return '無効な認証情報です。';
        case 'operation-not-allowed':
          return 'Googleログインは許可されていません。';
      // その他のFirebase Authエラーコード...
        default:
          return 'ログイン中にエラーが発生しました。';
      }
    } else if (e is FirebaseException) {
      switch (e.code) {
        case 'permission-denied':
          return 'Firestoreへのアクセス権限がありません。';
        case 'not-found':
          return '要求されたドキュメントは見つかりませんでした。';
      // その他のFirestoreエラーコード...
        default:
          return 'データベース操作中にエラーが発生しました。';
      }
    } else {
      return '不明なエラーが発生しました。';
    }
  }

  static AlertDialog getAlertDialog(BuildContext context, Object? e) {
    return AlertDialog(
      title: Text('エラー'),
      content: Text(getMessage(e)),
      actions: [
        TextButton(
          child: Text('OK'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  static void showErrorDialog(BuildContext context, Object? e) {
    showDialog(
      context: context,
      builder: (context) {
        return getAlertDialog(context, e);
      },
    );
  }
}
