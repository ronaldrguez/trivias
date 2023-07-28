import 'package:trivia/models/trivia.dart';
import 'package:trivia/provider/local/trivia_local_provider.dart';
import 'package:trivia/provider/trivia_provider.dart';

class TriviaRepository {
  final TriviaProvider provider;

  const TriviaRepository({this.provider = const TriviaLocalProvider()});

  Trivia getTrivia(String category) => provider.getTrivia(category);
  void saveTrivia(Trivia trivia) => provider.saveTrivia(trivia);
}