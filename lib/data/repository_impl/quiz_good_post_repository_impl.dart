// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:share_quiz/data/good/good_dto.dart';
import '../../domain/repository/quiz_good_post_repository.dart';
import '../firebase_auth/firebase_auth_store.dart';
import '../firestore_transaction/fire_store_transaction_store.dart';
import '../good/good_firebase_store.dart';
import '../quiz/quiz_firebase_store.dart';

class QuizGoodPostRepositoryImpl implements QuizGoodPostRepository {
  final _firebaseAuthStore = FirebaseAuthStore();
  final _goodFirebaseStore = GoodFirebaseStore();
  final _quizFirebaseStore = QuizFirebaseStore();
  final _transactionStore = FireStoreTransactionStore();

  @override
  Future<void> post(String quizId, bool isGood) async {
    return _transactionStore.runTransaction(
      (transaction) async {
        final quizDoc = _quizFirebaseStore.getDoc(quizId);
        final updateQuiz = await transaction.get(quizDoc);
        final goods = await _goodFirebaseStore.fetchGood(quizDoc);
        final goodCount = goods.length + (isGood ? 1 : -1);
        var user = _firebaseAuthStore.getCurrentUser();
        if(isGood) {
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
