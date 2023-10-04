// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      id: json['id'] as String,
      sentence: json['sentence'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      rightAnswer: json['rightAnswer'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sentence': instance.sentence,
      'answers': instance.answers,
      'rightAnswer': instance.rightAnswer,
      'category': instance.category,
    };
