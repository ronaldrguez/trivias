import 'package:trivia/models/category_trivia.dart';
import 'package:trivia/models/trivia.dart';
import 'package:trivia/provider/online/trivia_online_provider.dart';
import 'package:trivia/provider/trivia_provider.dart';

class TriviaRepository {
  final TriviaProvider provider;

  const TriviaRepository({this.provider = const TriviaOnlineProvider()});

  Future<Trivia> getTrivia(CategoryTrivia category) => provider.getTrivia(category);
  void saveTrivia(Trivia trivia) => provider.saveTrivia(trivia);
}