import 'package:trivia/models/trivia.dart';

abstract class TriviaProvider {
  const TriviaProvider();

  Trivia getTrivia(String category);

  void saveTrivia(Trivia trivia);
}