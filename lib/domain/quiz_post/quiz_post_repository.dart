import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_quiz/data/image/firebase_storage_data_store.dart';
import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/domain/quiz_post/quiz_post_data.dart';

class QuizPostRepository {
  final _storage = FirebaseStorageDataStore();
  final _fireStore = QuizFirebaseStore();

  store(QuizPostData post) async {
    final imageUrl = await _storage.uploadFile(post.imageFile);
    final json = {
      "title": post.title,
      "question": post.question,
      "choices": post.choices,
      "answer": post.answer,
      "image_url": imageUrl,
      "created_at": FieldValue.serverTimestamp()
    };
    _fireStore.post(json);
  }
}
