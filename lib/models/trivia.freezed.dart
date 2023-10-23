// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trivia.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Trivia _$TriviaFromJson(Map<String, dynamic> json) {
  return _Trivia.fromJson(json);
}

/// @nodoc
mixin _$Trivia {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  CategoryTrivia get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'questions')
  List<Question> get questions => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  int get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'answers')
  Map<String, dynamic> get answers => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'points')
  double get points => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TriviaCopyWith<Trivia> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriviaCopyWith<$Res> {
  factory $TriviaCopyWith(Trivia value, $Res Function(Trivia) then) =
      _$TriviaCopyWithImpl<$Res, Trivia>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'category') CategoryTrivia category,
      @JsonKey(name: 'questions') List<Question> questions,
      @JsonKey(name: 'duration') int duration,
      @JsonKey(name: 'answers') Map<String, dynamic> answers,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'points') double points});

  $CategoryTriviaCopyWith<$Res> get category;
}

/// @nodoc
class _$TriviaCopyWithImpl<$Res, $Val extends Trivia>
    implements $TriviaCopyWith<$Res> {
  _$TriviaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = null,
    Object? questions = null,
    Object? duration = null,
    Object? answers = null,
    Object? userId = null,
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryTrivia,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryTriviaCopyWith<$Res> get category {
    return $CategoryTriviaCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TriviaCopyWith<$Res> implements $TriviaCopyWith<$Res> {
  factory _$$_TriviaCopyWith(_$_Trivia value, $Res Function(_$_Trivia) then) =
      __$$_TriviaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'category') CategoryTrivia category,
      @JsonKey(name: 'questions') List<Question> questions,
      @JsonKey(name: 'duration') int duration,
      @JsonKey(name: 'answers') Map<String, dynamic> answers,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'points') double points});

  @override
  $CategoryTriviaCopyWith<$Res> get category;
}

/// @nodoc
class __$$_TriviaCopyWithImpl<$Res>
    extends _$TriviaCopyWithImpl<$Res, _$_Trivia>
    implements _$$_TriviaCopyWith<$Res> {
  __$$_TriviaCopyWithImpl(_$_Trivia _value, $Res Function(_$_Trivia) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = null,
    Object? questions = null,
    Object? duration = null,
    Object? answers = null,
    Object? userId = null,
    Object? points = null,
  }) {
    return _then(_$_Trivia(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryTrivia,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Trivia extends _Trivia {
  const _$_Trivia(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'category') required this.category,
      @JsonKey(name: 'questions') required final List<Question> questions,
      @JsonKey(name: 'duration') required this.duration,
      @JsonKey(name: 'answers') required final Map<String, dynamic> answers,
      @JsonKey(name: 'userId') required this.userId,
      @JsonKey(name: 'points') required this.points})
      : _questions = questions,
        _answers = answers,
        super._();

  factory _$_Trivia.fromJson(Map<String, dynamic> json) =>
      _$$_TriviaFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'category')
  final CategoryTrivia category;
  final List<Question> _questions;
  @override
  @JsonKey(name: 'questions')
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  @JsonKey(name: 'duration')
  final int duration;
  final Map<String, dynamic> _answers;
  @override
  @JsonKey(name: 'answers')
  Map<String, dynamic> get answers {
    if (_answers is EqualUnmodifiableMapView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

  @override
  @JsonKey(name: 'userId')
  final String userId;
  @override
  @JsonKey(name: 'points')
  final double points;

  @override
  String toString() {
    return 'Trivia(id: $id, category: $category, questions: $questions, duration: $duration, answers: $answers, userId: $userId, points: $points)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Trivia &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      const DeepCollectionEquality().hash(_questions),
      duration,
      const DeepCollectionEquality().hash(_answers),
      userId,
      points);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TriviaCopyWith<_$_Trivia> get copyWith =>
      __$$_TriviaCopyWithImpl<_$_Trivia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TriviaToJson(
      this,
    );
  }
}

abstract class _Trivia extends Trivia {
  const factory _Trivia(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'category') required final CategoryTrivia category,
      @JsonKey(name: 'questions') required final List<Question> questions,
      @JsonKey(name: 'duration') required final int duration,
      @JsonKey(name: 'answers') required final Map<String, dynamic> answers,
      @JsonKey(name: 'userId') required final String userId,
      @JsonKey(name: 'points') required final double points}) = _$_Trivia;
  const _Trivia._() : super._();

  factory _Trivia.fromJson(Map<String, dynamic> json) = _$_Trivia.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'category')
  CategoryTrivia get category;
  @override
  @JsonKey(name: 'questions')
  List<Question> get questions;
  @override
  @JsonKey(name: 'duration')
  int get duration;
  @override
  @JsonKey(name: 'answers')
  Map<String, dynamic> get answers;
  @override
  @JsonKey(name: 'userId')
  String get userId;
  @override
  @JsonKey(name: 'points')
  double get points;
  @override
  @JsonKey(ignore: true)
  _$$_TriviaCopyWith<_$_Trivia> get copyWith =>
      throw _privateConstructorUsedError;
}
