// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/data/quiz/quiz_dto.dart';
import '../../domain/models/quiz_post/quiz_post_data.dart';
import '../../domain/repository/quiz_post_repository.dart';
import '../quiz/quiz_firebase_store.dart';
import '../storage/firebase_storage_data_store.dart';

class QuizPostRepositoryImpl extends QuizPostRepository {
  final _storage = FirebaseStorageDataStore();
  final _quizFireStore = QuizFirebaseStore();
  final _userFireStore = FirebaseAuthStore();

  @override
  Future<void> store(QuizPostData post) async {
    final user = _userFireStore.getCurrentUser();
    final userId = user!.uid;
    final imageUrl = await _storage.uploadFile(post.imageFile, userId);

    var json = QuizDto(
            title: post.title,
            question: post.question,
            choices: post.choices,
            correctAnswer: post.answer,
            imageUrl: imageUrl,
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
