// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sentence')
  @HiveField(1)
  String get sentence => throw _privateConstructorUsedError;
  @JsonKey(name: 'answers')
  @HiveField(2)
  List<Answer> get answers => throw _privateConstructorUsedError;
  @JsonKey(name: 'rightAnswer')
  @HiveField(3)
  int get rightAnswer => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  @HiveField(4)
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'sentence') @HiveField(1) String sentence,
      @JsonKey(name: 'answers') @HiveField(2) List<Answer> answers,
      @JsonKey(name: 'rightAnswer') @HiveField(3) int rightAnswer,
      @JsonKey(name: 'category') @HiveField(4) String category});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sentence = null,
    Object? answers = null,
    Object? rightAnswer = null,
    Object? category = null,
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
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      rightAnswer: null == rightAnswer
          ? _value.rightAnswer
          : rightAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'sentence') @HiveField(1) String sentence,
      @JsonKey(name: 'answers') @HiveField(2) List<Answer> answers,
      @JsonKey(name: 'rightAnswer') @HiveField(3) int rightAnswer,
      @JsonKey(name: 'category') @HiveField(4) String category});
}

/// @nodoc
class __$$_QuestionCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$_Question>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sentence = null,
    Object? answers = null,
    Object? rightAnswer = null,
    Object? category = null,
  }) {
    return _then(_$_Question(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sentence: null == sentence
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      rightAnswer: null == rightAnswer
          ? _value.rightAnswer
          : rightAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveTypeHelper.questionType, adapterName: 'QuestionAdapter')
class _$_Question implements _Question {
  const _$_Question(
      {@JsonKey(name: 'id')
      @HiveField(0)
          required this.id,
      @JsonKey(name: 'sentence')
      @HiveField(1)
          required this.sentence,
      @JsonKey(name: 'answers')
      @HiveField(2)
          required final List<Answer> answers,
      @JsonKey(name: 'rightAnswer')
      @HiveField(3)
          required this.rightAnswer,
      @JsonKey(name: 'category')
      @HiveField(4)
          required this.category})
      : _answers = answers;

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final int id;
  @override
  @JsonKey(name: 'sentence')
  @HiveField(1)
  final String sentence;
  final List<Answer> _answers;
  @override
  @JsonKey(name: 'answers')
  @HiveField(2)
  List<Answer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  @JsonKey(name: 'rightAnswer')
  @HiveField(3)
  final int rightAnswer;
  @override
  @JsonKey(name: 'category')
  @HiveField(4)
  final String category;

  @override
  String toString() {
    return 'Question(id: $id, sentence: $sentence, answers: $answers, rightAnswer: $rightAnswer, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sentence, sentence) ||
                other.sentence == sentence) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.rightAnswer, rightAnswer) ||
                other.rightAnswer == rightAnswer) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, sentence,
      const DeepCollectionEquality().hash(_answers), rightAnswer, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {@JsonKey(name: 'id')
      @HiveField(0)
          required final int id,
      @JsonKey(name: 'sentence')
      @HiveField(1)
          required final String sentence,
      @JsonKey(name: 'answers')
      @HiveField(2)
          required final List<Answer> answers,
      @JsonKey(name: 'rightAnswer')
      @HiveField(3)
          required final int rightAnswer,
      @JsonKey(name: 'category')
      @HiveField(4)
          required final String category}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'sentence')
  @HiveField(1)
  String get sentence;
  @override
  @JsonKey(name: 'answers')
  @HiveField(2)
  List<Answer> get answers;
  @override
  @JsonKey(name: 'rightAnswer')
  @HiveField(3)
  int get rightAnswer;
  @override
  @JsonKey(name: 'category')
  @HiveField(4)
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
