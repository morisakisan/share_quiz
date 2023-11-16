// Project imports:
import 'package:share_quiz/data/firestore/answer/answer_firebase_store.dart';
import 'package:share_quiz/data/firestore/good/good_firebase_store.dart';
import 'package:share_quiz/data/firestore/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/data/storage/firebase_storage_data_store.dart';
import '../../domain/repository/delete_quiz_repository.dart';

class DeleteQuizRepositoryImpl extends DeleteQuizRepository {
  final quizStore = QuizFirebaseStore();
  final goodStore = GoodFirebaseStore();
  final answer = AnswerFirebaseStore();
  final storage = FirebaseStorageDataStore();

  @override
  Future<void> deleteQuiz(String docId) async {
    var dto = await quizStore.getDto(docId);
    await goodStore.deleteAllDocuments(docId);
    await answer.deleteAllDocuments(docId);
    var imageUrl = dto?.imageUrl;
    if (imageUrl != null) {
      await storage.deleteFileFromURL(imageUrl);
    }
    await quizStore.deleteDocument(docId);
  }
}
