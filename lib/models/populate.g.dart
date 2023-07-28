// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'populate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Populate _$$_PopulateFromJson(Map<String, dynamic> json) => _$_Populate(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryTrivia.fromJson(e as Map<String, dynamic>))
          .toList(),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PopulateToJson(_$_Populate instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'questions': instance.questions,
    };
