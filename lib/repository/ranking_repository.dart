import 'package:trivia/models/trivia.dart';
import 'package:trivia/models/user.dart';
import 'package:trivia/provider/local/ranking_local_provider.dart';
import 'package:trivia/provider/ranking_provider.dart';

class RankingRepository {
  final RankingProvider provider;

  const RankingRepository({this.provider = const RankingLocalProvider()});

  List<Trivia> getAllTrivias() => provider.getAllTrivias();

  Map<String, List<Trivia>> getAllTriviasByCategory() => provider.getAllTriviasByCategory();

  User findUser(String userId) => provider.findUser(userId);
}