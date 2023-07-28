import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia/models/category_trivia.dart';
import 'package:trivia/models/question.dart';

part 'populate.freezed.dart';
part 'populate.g.dart';

@Freezed(toJson: true)
class Populate with _$Populate {

  const factory Populate({
    @JsonKey(name: 'categories')
    required List<CategoryTrivia> categories,
    @JsonKey(name: 'questions')
    required List<Question> questions,
  }) = _Populate;

  factory Populate.fromJson(Map<String, dynamic> json) => _$PopulateFromJson(json);
}