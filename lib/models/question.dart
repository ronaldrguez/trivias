import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia/models/answer.dart';
import 'package:trivia/utils/helpers/hive_type_helper.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@Freezed(toJson: true)
class Question with _$Question {

  @HiveType(typeId: HiveTypeHelper.questionType, adapterName: 'QuestionAdapter')
  const factory Question({
    @JsonKey(name: 'id')
    @HiveField(0)
    required int id,
    @JsonKey(name: 'sentence')
    @HiveField(1)
    required String sentence,
    @JsonKey(name: 'answers')
    @HiveField(2)
    required List<Answer> answers,
    @JsonKey(name: 'rightAnswer')
    @HiveField(3)
    required int rightAnswer,
    @JsonKey(name: 'category')
    @HiveField(4)
    required String category,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}