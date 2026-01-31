// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreTransactionStore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> runTransaction<T>(Future<T> Function(Transaction transaction) updateFunction) {
    return _firestore.runTransaction(updateFunction);
  }
}
