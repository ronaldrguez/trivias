// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trivia.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TriviaAdapter extends TypeAdapter<_$_Trivia> {
  @override
  final int typeId = 30;

  @override
  _$_Trivia read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Trivia(
      id: fields[0] as String,
      category: fields[1] as String,
      questions: (fields[2] as List).cast<Question>(),
      duration: fields[3] as int,
      answers: (fields[4] as Map).cast<int, int>(),
      userId: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Trivia obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.questions)
      ..writeByte(4)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TriviaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Trivia _$$_TriviaFromJson(Map<String, dynamic> json) => _$_Trivia(
      id: json['id'] as String,
      category: json['category'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as int,
      answers: (json['answers'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as int),
      ),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$_TriviaToJson(_$_Trivia instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'questions': instance.questions,
      'duration': instance.duration,
      'answers': instance.answers.map((k, e) => MapEntry(k.toString(), e)),
      'userId': instance.userId,
    };
