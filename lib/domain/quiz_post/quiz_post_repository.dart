// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:share_quiz/data/image/firebase_storage_data_store.dart';
import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/data/user/user_firebase_store.dart';
import 'package:share_quiz/domain/quiz_post/quiz_post_data.dart';

class QuizPostRepository {
  final _storage = FirebaseStorageDataStore();
  final _quizFireStore = QuizFirebaseStore();
  final _userFireStore = UserFirebaseStore();

  Future<void> store(QuizPostData post) async {
    final imageUrl = await _storage.uploadFile(post.imageFile);
    final user = await _userFireStore.gerCurrentUser();
    final json = {
      "title": post.title,
      "question": post.question,
      "choices": post.choices,
      "correct_answer": post.answer,
      "image_url": imageUrl,
      "created_at": FieldValue.serverTimestamp(),
      "user_id": user!.uid
    };
    return _quizFireStore.post(json);
  }
}
