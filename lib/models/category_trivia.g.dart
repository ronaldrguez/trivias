// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_trivia.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryTriviaAdapter extends TypeAdapter<_$_CategoryTrivia> {
  @override
  final int typeId = 110;

  @override
  _$_CategoryTrivia read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_CategoryTrivia(
      id: fields[0] as int,
      sentence: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_CategoryTrivia obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sentence);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryTriviaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryTrivia _$$_CategoryTriviaFromJson(Map<String, dynamic> json) =>
    _$_CategoryTrivia(
      id: json['id'] as int,
      sentence: json['category'] as String,
    );

Map<String, dynamic> _$$_CategoryTriviaToJson(_$_CategoryTrivia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.sentence,
    };
