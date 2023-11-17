// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/data/firestore/quiz/quiz_dto.dart';
import 'package:share_quiz/data/firestore/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/data/storage/firebase_storage_data_store.dart';
import 'package:share_quiz/domain/models/quiz_post/quiz_post_data.dart';
import 'package:share_quiz/domain/repository/quiz_post_repository.dart';

class QuizPostRepositoryImpl extends QuizPostRepository {
  final _storage = FirebaseStorageDataStore();
  final _quizFireStore = QuizFirebaseStore();
  final _authStore = FirebaseAuthStore();

  @override
  Future<void> store(QuizPostData post) async {
    final user = _authStore.getCurrentUser();
    final userId = user!.uid;

    final images = <String>[];
    if(post.imageFile != null) {
      final imageUrl = await _storage.uploadFile(post.imageFile!, userId);
      images.add(imageUrl);
    }

    var json = QuizDto(
            title: post.title,
            question: post.question,
            choices: post.choices,
            correctAnswer: post.answer,
            imageUrl: images,
            createdAt: null,
            uid: userId,
            answerCount: null,
            goodCount: null,
            correctAnswerRate: null)
        .toJson();
    json['created_at'] = FieldValue.serverTimestamp();
    return await _quizFireStore.post(json);
  }
}
