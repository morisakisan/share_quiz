import 'package:share_quiz/provider/quiz_list_repository_provider.dart';

import '../data/repository_impl/quiz_list_repository_impl.dart';

// You can define global overrides here if needed
final globalOverrides = [
  quizListRepositoryProvider.overrideWithValue(QuizListRepositoryImpl()),
  // Add other overrides here
];