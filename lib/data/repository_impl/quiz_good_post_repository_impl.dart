import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repository/quiz_good_repository.dart';
import '../firebase_auth/firebase_auth_store.dart';
import '../firestore_transaction/fire_store_transaction_store.dart';
import '../good/good_firebase_store.dart';
import '../quiz/quiz_dto.dart';
import '../quiz/quiz_firebase_store.dart';

class QuizGoodPostRepositoryImpl implements QuizGoodPostRepository {

  final _firebaseAuthStore = FirebaseAuthStore();
  final _goodFirebaseStore = GoodFirebaseStore();
  final _quizFirebaseStore = QuizFirebaseStore();
  final _transactionStore = FireStoreTransactionStore();

  @override
  Future<void> post(String quizId, bool isGood) async {
    return _transactionStore.runTransaction((transaction) async {
      final quizDoc = _quizFirebaseStore.getDoc(quizId);
      final updateQuiz = await transaction.get(quizDoc);
      final updateQuizDto = QuizDto.fromJson(updateQuiz.data()!);
      final goods = await _goodFirebaseStore.fetchGood(quizDoc);
      final goodCount = goods.length + 1 + (isGood ? 1 : -1);
      var user = _firebaseAuthStore.getCurrentUser();
      var answerJson = {
        "answer": select,
        "uid": user!.uid,
        "is_correct": isCorrect,
        "created_at": FieldValue.serverTimestamp()
      };
      _goodFirebaseStore.addGoodInTransaction(
          transaction, updateQuiz.reference, answerJson);
      _quizFirebaseStore.updateQuizInTransaction(
          transaction, updateQuiz.reference, rate, answerCount);
    },
    );
  }
}

}