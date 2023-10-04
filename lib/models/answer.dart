import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'answer.freezed.dart';
part 'answer.g.dart';

@Freezed(toJson: true,)
class Answer with _$Answer {

  const factory Answer({
    @JsonKey(name: 'id')
    required String id,
    @JsonKey(name: 'sentence')
    required String sentence,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}