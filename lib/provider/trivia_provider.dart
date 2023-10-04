import 'package:trivia/models/category_trivia.dart';
import 'package:trivia/models/trivia.dart';

abstract class TriviaProvider {
  const TriviaProvider();

  Future<Trivia> getTrivia(CategoryTrivia category);

  void saveTrivia(Trivia trivia);
}