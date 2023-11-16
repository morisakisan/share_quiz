// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/data/firestore/firestore_transaction/fire_store_transaction_store.dart';
import 'package:share_quiz/data/firestore/good/good_dto.dart';
import 'package:share_quiz/data/firestore/good/good_firebase_store.dart';
import 'package:share_quiz/data/firestore/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/domain/repository/quiz_good_post_repository.dart';

class QuizGoodPostRepositoryImpl implements QuizGoodPostRepository {
  final _firebaseAuthStore = FirebaseAuthStore();
  final _goodFirebaseStore = GoodFirebaseStore();
  final _quizFirebaseStore = QuizFirebaseStore();
  final _transactionStore = FireStoreTransactionStore();

  @override
  Future<void> post(String quizId) async {
    return _transactionStore.runTransaction(
      (transaction) async {
        final user = _firebaseAuthStore.getCurrentUser();
        final quizDoc = _quizFirebaseStore.getDoc(quizId);
        final updateQuiz = await transaction.get(quizDoc);
        final goods = await _goodFirebaseStore.fetchGood(quizDoc);
        final goodItem =
            goods.firstWhereOrNull((good) => good.userId == user!.uid);
        final isGood = goodItem == null;
        final goodCount = goods.length + (isGood ? 1 : -1);

        if (isGood) {
          var goodJson = GoodDto(userId: user!.uid, createdAt: null).toJson();
          goodJson['created_at'] = FieldValue.serverTimestamp();
          await _goodFirebaseStore.addGoodInTransaction(
              transaction, updateQuiz.reference, goodJson);
        } else {
          await _goodFirebaseStore.deleteGoodInTransaction(
              transaction, updateQuiz.reference, user!.uid);
        }

        _quizFirebaseStore.updateQuizGoodCountInTransaction(
            transaction, updateQuiz.reference, goodCount);
      },
    );
  }
}
