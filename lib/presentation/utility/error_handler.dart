// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// Project imports:
import 'package:share_quiz/presentation/common/error_dialog.dart';

class ErrorHandler {
  ErrorHandler._();

  static String getMessage(Object? e, StackTrace? stackTrace) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'account-exists-with-different-credential':
          return '異なる認証情報でアカウントが存在します。';
        case 'invalid-credential':
          return '無効な認証情報です。';
        case 'operation-not-allowed':
          return 'Googleログインは許可されていません。';
        default:
          return 'ログイン中にエラーが発生しました。';
      }
    } else if (e is FirebaseException) {
      switch (e.code) {
        case 'permission-denied':
          return 'Firestoreへのアクセス権限がありません。';
        case 'not-found':
          return '要求されたドキュメントは見つかりませんでした。';
        default:
          return 'データベース操作中にエラーが発生しました。';
      }
    } else {
      _reportError(e, stackTrace);
      return '不明なエラーが発生しました。';
    }
  }

  static _reportError(Object? error, StackTrace? stackTrace) async {
    await FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }

  static void showErrorDialog(
      BuildContext context, Object? e, StackTrace? stackTrace) {
    showDialog(
      context: context,
      builder: (context) {
        return ErrorDialog(e, stackTrace);
      },
    );
  }
}
