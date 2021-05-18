import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_quiz/data/image/firebase_storage_data_store.dart';
import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/domain/quiz_post/quiz_post_data.dart';
import 'package:share_quiz/domain/quiz_post/quiz_post_state.dart';

class QuizPostRepository {
  final _storage = FirebaseStorageDataStore();
  final _fireStore = QuizFirebaseStore();

  Future<QuizPostState> store(QuizPostData post) async {
    final imageUrl = await _storage.uploadFile(post.imageFile);
    final json = {
      "title": post.title,
      "question": post.question,
      "choices": post.choices,
      "answer": post.answer,
      "image_url": imageUrl,
      "created_at": FieldValue.serverTimestamp()
    };
    await _fireStore.post(json);
    return QuizPostState();
  }
}
