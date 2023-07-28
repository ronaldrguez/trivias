import 'package:trivia/models/preferences.dart';
import 'package:trivia/models/trivia.dart';
import 'package:trivia/models/user.dart';
import 'package:trivia/provider/ranking_provider.dart';
import 'package:trivia/utils/enum/category.dart';
import 'package:trivia/utils/services/hive_service.dart';


class RankingLocalProvider extends RankingProvider {
  const RankingLocalProvider();

  @override
  List<Trivia> getAllTrivias() {
    final trivias = HiveService.getAll<Trivia>(HiveBoxes.triviaBox.value);
    trivias.sort((a,b) => b.total.compareTo(a.total));
    return trivias;
  }

  @override
  Map<String,List<Trivia>> getAllTriviasByCategory() {
    final map = <String,List<Trivia>>{};
    final categories = CategoryEnum.getAllCategories;
    final trivias = HiveService.getAll<Trivia>(HiveBoxes.triviaBox.value);
    for(var category in categories) {
      map[category] = trivias.where((trivia) => trivia.category == category).toList();
    }
    return map;
  }

  User findUser(String userId) {
    final users = HiveService.getAll<User>(HiveBoxes.usersBox.value);
    return users.firstWhere((user) => user.id == userId);
  }
}