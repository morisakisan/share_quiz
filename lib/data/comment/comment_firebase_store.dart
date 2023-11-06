// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:share_quiz/data/comment/comment_dto.dart';

class CommentFirebaseStore {
  // CollectionReference<Map<String, dynamic>> _getCollection(String quizId) {
  //   return _getCommentCollectionFromQuiz(
  //       FirebaseFirestore.instance.collection('quiz').doc(quizId));
  // }

  CollectionReference<Map<String, dynamic>> _getCommentCollectionFromQuiz(
      DocumentReference<Map<String, dynamic>> quiz) {
    return quiz.collection('comment');
  }

  Future<List<CommentDto>> fetchComments(
      DocumentReference<Map<String, dynamic>> quiz) {
    return _getCommentCollectionFromQuiz(quiz)
        .get()
        .then<List<CommentDto>>((query) => query.docs.map((e) {
              var json = e.data();
              return CommentDto.fromJson(json);
            }).toList());
  }

  void addCommentInTransaction(
      Transaction transaction,
      DocumentReference<Map<String, dynamic>> quizReference,
      Map<String, dynamic> answerJson) {
    transaction.set(
        _getCommentCollectionFromQuiz(quizReference).doc(), answerJson);
  }
}
