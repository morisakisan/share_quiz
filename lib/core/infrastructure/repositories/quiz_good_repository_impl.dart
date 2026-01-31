// Package imports:
import 'package:collection/collection.dart';

// Project imports:
import 'package:share_quiz/core/infrastructure/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/core/infrastructure/firestore/firestore_transaction/fire_store_transaction_store.dart';
import 'package:share_quiz/core/infrastructure/firestore/good/good_dto.dart';
import 'package:share_quiz/core/infrastructure/firestore/good/good_firebase_store.dart';
import 'package:share_quiz/core/infrastructure/firestore/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/core/domain/repositories/quiz_good_repository.dart';

class QuizGoodRepositoryImpl implements QuizGoodRepository {
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
