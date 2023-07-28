import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:trivia/models/question.dart';
import 'package:trivia/utils/helpers/hive_type_helper.dart';

part 'trivia.freezed.dart';
part 'trivia.g.dart';

@Freezed(toJson: true)
class Trivia with _$Trivia {

  const Trivia._();

  @HiveType(typeId: HiveTypeHelper.triviaType, adapterName: 'TriviaAdapter')
  const factory Trivia({
    @JsonKey(name: 'id')
    @HiveField(0)
    required String id,
    @JsonKey(name: 'category')
    @HiveField(1)
    required String category,
    @JsonKey(name: 'questions')
    @HiveField(2)
    required List<Question> questions,
    @JsonKey(name: 'duration')
    @HiveField(3)
    required int duration,
    @JsonKey(name: 'answers')
    @HiveField(4)
    required Map<int, int> answers,
    @JsonKey(name: 'userId')
    @HiveField(5)
    required String userId
  }) = _Trivia;

  factory Trivia.fromJson(Map<String, dynamic> json) => _$TriviaFromJson(json);

  int get rightAnswers{
    int cont = 0;
    for (var question in questions) {
      if(question.rightAnswer == answers[question.id]){
        cont ++;
      }
    }
    return cont;
  }

  double get total {
    return (rightAnswers * 10000) / duration;
  }
}