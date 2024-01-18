

import 'package:algolia/algolia.dart';

class QuizAlgoliaStore {

  Algolia _getQuizAlgolia() {
    return const Algolia.init(applicationId: 'YOUR_APP_ID', apiKey: 'YOUR_API_KEY');
  }

}