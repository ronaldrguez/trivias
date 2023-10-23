import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia/models/category_trivia.dart';
import 'package:trivia/models/question.dart';

part 'trivia.freezed.dart';
part 'trivia.g.dart';

@Freezed()
class Trivia with _$Trivia {

  const Trivia._();

  const factory Trivia({
    @JsonKey(name: 'id')
    String? id,
    @JsonKey(name: 'category')
    required CategoryTrivia category,
    @JsonKey(name: 'questions')
    required List<Question> questions,
    @JsonKey(name: 'duration')
    required int duration,
    @JsonKey(name: 'answers')
    required Map<String, dynamic> answers,
    @JsonKey(name: 'userId')
    required String userId,
    @JsonKey(name: 'points')
    required double points
  }) = _Trivia;

  factory Trivia.fromJson(Map<String, dynamic> json) => _$TriviaFromJson(json);

  @override
  Map<String,dynamic> toJson() => {
    'category': category,
    'questions': questions.map((e) => e.toJson()).toList(),
    'duration': duration,
    'answers': answers,
    'userId': userId,
    'points': points,
  };

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

  Map<String,dynamic> triviaToFirebase() {
    return {
      "category": category.id,
      "questions": questions.map((e) => e.id),
      "duration": duration,
      "answers": answers,
      "userId": userId,
      "points": points,
    };
  }
}