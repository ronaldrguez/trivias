// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trivia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Trivia _$$_TriviaFromJson(Map<String, dynamic> json) => _$_Trivia(
      id: json['id'] as String?,
      category:
          CategoryTrivia.fromJson(json['category'] as Map<String, dynamic>),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as int,
      answers: Map<String, String>.from(json['answers'] as Map),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$_TriviaToJson(_$_Trivia instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'questions': instance.questions,
      'duration': instance.duration,
      'answers': instance.answers,
      'userId': instance.userId,
    };
