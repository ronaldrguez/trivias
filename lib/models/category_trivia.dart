import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:trivia/utils/helpers/hive_type_helper.dart';
part 'category_trivia.freezed.dart';
part 'category_trivia.g.dart';

@Freezed(toJson: true,)
class CategoryTrivia with _$CategoryTrivia {

  @HiveType(typeId: HiveTypeHelper.categoryType, adapterName: 'CategoryTriviaAdapter')
  const factory CategoryTrivia({
    @JsonKey(name: 'id')
    @HiveField(0)
    required int id,
    @JsonKey(name: 'category')
    @HiveField(1)
    required String sentence,
  }) = _CategoryTrivia;

  factory CategoryTrivia.fromJson(Map<String, dynamic> json) => _$CategoryTriviaFromJson(json);
}