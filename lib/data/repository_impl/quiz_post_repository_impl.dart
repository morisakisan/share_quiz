// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import '../../domain/models/quiz_post/quiz_post_data.dart';
import '../../domain/repository/quiz_post_repository.dart';
import '../image/firebase_storage_data_store.dart';
import '../quiz/quiz_firebase_store.dart';
import '../user/user_firebase_store.dart';

class QuizPostRepositoryImpl extends QuizPostRepository {
  final _storage = FirebaseStorageDataStore();
  final _quizFireStore = QuizFirebaseStore();
  final _userFireStore = UserFirebaseStore();

  @override
  Future<void> store(QuizPostData post) async {
    final imageUrl = await _storage.uploadFile(post.imageFile);
    final user = await _userFireStore.getCurrentUser();
    final json = {
      "title": post.title,
      "question": post.question,
      "choices": post.choices,
      "correct_answer": post.answer,
      "image_url": imageUrl,
      "created_at": FieldValue.serverTimestamp(),
      "user_id": user!.uid,
      "answer_count": 0,
    };
    return _quizFireStore.post(json);
  }
}
