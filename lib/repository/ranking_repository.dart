import 'package:trivia/models/trivia.dart';
import 'package:trivia/models/user.dart';
import 'package:trivia/provider/online/ranking_online_provider.dart';
import 'package:trivia/provider/ranking_provider.dart';

class RankingRepository {
  final RankingProvider provider;

  const RankingRepository({this.provider = const RankingOnlineProvider()});

  Future<List<Trivia>> getAllTrivias() => provider.getAllTrivias();

  Map<String, List<Trivia>> getAllTriviasByCategory() => provider.getAllTriviasByCategory();

  Future<List<User>> getAllUsers() => provider.getAllUsers();
}