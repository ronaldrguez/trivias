import 'package:trivia/models/trivia.dart';
import 'package:trivia/models/user.dart';

abstract class RankingProvider {
  const RankingProvider();

  Future<List<Trivia>> getAllTrivias();

  Map<String,List<Trivia>> getAllTriviasByCategory();

  Future<List<User>> getAllUsers();
}