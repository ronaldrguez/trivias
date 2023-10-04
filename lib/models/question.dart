import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia/models/answer.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@Freezed()
class Question with _$Question {

  const factory Question({
    @JsonKey(name: 'id')
    required String id,
    @JsonKey(name: 'sentence')
    required String sentence,
    @JsonKey(name: 'answers')
    required List<Answer> answers,
    @JsonKey(name: 'rightAnswer')
    required String rightAnswer,
    @JsonKey(name: 'category')
    required String category,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  Map<String,dynamic> toJson() => {
    'sentence': sentence,
    'answers': answers.map((e) => e.toJson()).toList(),
    'rightAnswer': rightAnswer,
    'category': category
  };
}