import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';

import '../../domain/repository/delete_quiz_repository.dart';
import '../answer/answer_firebase_store.dart';
import '../good/good_firebase_store.dart';

class DeleteQuizRepositoryImpl extends DeleteQuizRepository {

  final quizStore = QuizFirebaseStore();
  final goodStore = GoodFirebaseStore();
  final answer = AnswerFirebaseStore();

  @override
  Future<void> deleteQuiz(String docId) async {
    await goodStore.deleteAllDocuments(docId);
    await answer.deleteAllDocuments(docId);
    await quizStore.deleteDocument(docId);
  }

}