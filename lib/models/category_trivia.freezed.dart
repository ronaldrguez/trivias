// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_trivia.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryTrivia _$CategoryTriviaFromJson(Map<String, dynamic> json) {
  return _CategoryTrivia.fromJson(json);
}

/// @nodoc
mixin _$CategoryTrivia {
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  @HiveField(1)
  String get sentence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryTriviaCopyWith<CategoryTrivia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryTriviaCopyWith<$Res> {
  factory $CategoryTriviaCopyWith(
          CategoryTrivia value, $Res Function(CategoryTrivia) then) =
      _$CategoryTriviaCopyWithImpl<$Res, CategoryTrivia>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'category') @HiveField(1) String sentence});
}

/// @nodoc
class _$CategoryTriviaCopyWithImpl<$Res, $Val extends CategoryTrivia>
    implements $CategoryTriviaCopyWith<$Res> {
  _$CategoryTriviaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sentence = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sentence: null == sentence
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryTriviaCopyWith<$Res>
    implements $CategoryTriviaCopyWith<$Res> {
  factory _$$_CategoryTriviaCopyWith(
          _$_CategoryTrivia value, $Res Function(_$_CategoryTrivia) then) =
      __$$_CategoryTriviaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'category') @HiveField(1) String sentence});
}

/// @nodoc
class __$$_CategoryTriviaCopyWithImpl<$Res>
    extends _$CategoryTriviaCopyWithImpl<$Res, _$_CategoryTrivia>
    implements _$$_CategoryTriviaCopyWith<$Res> {
  __$$_CategoryTriviaCopyWithImpl(
      _$_CategoryTrivia _value, $Res Function(_$_CategoryTrivia) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sentence = null,
  }) {
    return _then(_$_CategoryTrivia(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sentence: null == sentence
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(
    typeId: HiveTypeHelper.categoryType, adapterName: 'CategoryTriviaAdapter')
class _$_CategoryTrivia implements _CategoryTrivia {
  const _$_CategoryTrivia(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'category') @HiveField(1) required this.sentence});

  factory _$_CategoryTrivia.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryTriviaFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final int id;
  @override
  @JsonKey(name: 'category')
  @HiveField(1)
  final String sentence;

  @override
  String toString() {
    return 'CategoryTrivia(id: $id, sentence: $sentence)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryTrivia &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sentence, sentence) ||
                other.sentence == sentence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, sentence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryTriviaCopyWith<_$_CategoryTrivia> get copyWith =>
      __$$_CategoryTriviaCopyWithImpl<_$_CategoryTrivia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryTriviaToJson(
      this,
    );
  }
}

abstract class _CategoryTrivia implements CategoryTrivia {
  const factory _CategoryTrivia(
      {@JsonKey(name: 'id')
      @HiveField(0)
          required final int id,
      @JsonKey(name: 'category')
      @HiveField(1)
          required final String sentence}) = _$_CategoryTrivia;

  factory _CategoryTrivia.fromJson(Map<String, dynamic> json) =
      _$_CategoryTrivia.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'category')
  @HiveField(1)
  String get sentence;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryTriviaCopyWith<_$_CategoryTrivia> get copyWith =>
      throw _privateConstructorUsedError;
}
