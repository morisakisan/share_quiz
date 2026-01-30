// Project imports:
import 'package:share_quiz/features/post/domain/models/quiz_post_data.dart';

abstract class QuizPostRepository {
  Future<void> store(QuizPostData post);
}
