import 'package:trivia/models/trivia.dart';
import 'package:trivia/models/user.dart';

abstract class RankingProvider {
  const RankingProvider();

  List<Trivia> getAllTrivias();

  Map<String,List<Trivia>> getAllTriviasByCategory();

  User findUser(String userId);
}