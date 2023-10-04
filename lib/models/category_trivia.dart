import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'category_trivia.freezed.dart';
part 'category_trivia.g.dart';

@Freezed(toJson: true,)
class CategoryTrivia with _$CategoryTrivia {

  const factory CategoryTrivia({
    @JsonKey(name: 'id')
    required String id,
    @JsonKey(name: 'category')
    required String sentence,
  }) = _CategoryTrivia;

  factory CategoryTrivia.fromJson(Map<String, dynamic> json) => _$CategoryTriviaFromJson(json);
}