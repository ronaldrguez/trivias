import 'dart:math';

import 'package:trivia/models/preferences.dart';
import 'package:trivia/models/question.dart';
import 'package:trivia/models/trivia.dart';
import 'package:trivia/provider/trivia_provider.dart';
import 'package:trivia/utils/services/hive_service.dart';
import 'package:uuid/uuid.dart';


class TriviaLocalProvider extends TriviaProvider {
  const TriviaLocalProvider();

  @override
  Trivia getTrivia(String category) {
    final preference = HiveService.getFirst<UserPreferences>(HiveBoxes.preferencesBox.value);
    final questions = HiveService.getAll<Question>(HiveBoxes.questionBox.value, where: (question) => question.category == category);
    final Set<Question> triviaQuestions = <Question>{};
    var random = Random();
    bool flag = true;
    while(flag) {
      var index = random.nextInt(questions.length - 1);
      triviaQuestions.add(questions.elementAt(index));
      if(triviaQuestions.length == 20) {
        flag = false;
      }
    }
    var uuid = const Uuid();

    return Trivia(id: uuid.v4(), userId: preference!.userId!, category: category, questions: triviaQuestions.toList(), duration: const Duration(seconds: 0).inSeconds, answers: <int,int>{});
  }

  @override
  void saveTrivia(Trivia trivia) {
    HiveService.save<Trivia>(HiveBoxes.triviaBox.value, trivia);
  }
}