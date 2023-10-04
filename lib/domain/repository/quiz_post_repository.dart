// Project imports:
import '../models/quiz_post/quiz_post_data.dart';

abstract class QuizPostRepository {

  Future<void> store(QuizPostData post);
}
