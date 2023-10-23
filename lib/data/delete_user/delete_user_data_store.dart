// Package imports:
import 'package:cloud_functions/cloud_functions.dart';

class DeleteUserDataStore {
  Future<void> deleteUserAccount() {
    final functions = FirebaseFunctions.instance;
    return functions.httpsCallable('deleteUserAccount').call();
  }
}
