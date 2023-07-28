import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:trivia/utils/helpers/hive_type_helper.dart';
part 'answer.freezed.dart';
part 'answer.g.dart';

@Freezed(toJson: true,)
class Answer with _$Answer {

  @HiveType(typeId: HiveTypeHelper.answerType, adapterName: 'AnswerAdapter')
  const factory Answer({
    @JsonKey(name: 'id')
    @HiveField(0)
    required int id,
    @JsonKey(name: 'sentence')
    @HiveField(1)
    required String sentence,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}