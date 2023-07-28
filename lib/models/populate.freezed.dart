// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'populate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Populate _$PopulateFromJson(Map<String, dynamic> json) {
  return _Populate.fromJson(json);
}

/// @nodoc
mixin _$Populate {
  @JsonKey(name: 'categories')
  List<CategoryTrivia> get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'questions')
  List<Question> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PopulateCopyWith<Populate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopulateCopyWith<$Res> {
  factory $PopulateCopyWith(Populate value, $Res Function(Populate) then) =
      _$PopulateCopyWithImpl<$Res, Populate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'categories') List<CategoryTrivia> categories,
      @JsonKey(name: 'questions') List<Question> questions});
}

/// @nodoc
class _$PopulateCopyWithImpl<$Res, $Val extends Populate>
    implements $PopulateCopyWith<$Res> {
  _$PopulateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryTrivia>,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PopulateCopyWith<$Res> implements $PopulateCopyWith<$Res> {
  factory _$$_PopulateCopyWith(
          _$_Populate value, $Res Function(_$_Populate) then) =
      __$$_PopulateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'categories') List<CategoryTrivia> categories,
      @JsonKey(name: 'questions') List<Question> questions});
}

/// @nodoc
class __$$_PopulateCopyWithImpl<$Res>
    extends _$PopulateCopyWithImpl<$Res, _$_Populate>
    implements _$$_PopulateCopyWith<$Res> {
  __$$_PopulateCopyWithImpl(
      _$_Populate _value, $Res Function(_$_Populate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? questions = null,
  }) {
    return _then(_$_Populate(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryTrivia>,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Populate implements _Populate {
  const _$_Populate(
      {@JsonKey(name: 'categories')
          required final List<CategoryTrivia> categories,
      @JsonKey(name: 'questions')
          required final List<Question> questions})
      : _categories = categories,
        _questions = questions;

  factory _$_Populate.fromJson(Map<String, dynamic> json) =>
      _$$_PopulateFromJson(json);

  final List<CategoryTrivia> _categories;
  @override
  @JsonKey(name: 'categories')
  List<CategoryTrivia> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Question> _questions;
  @override
  @JsonKey(name: 'questions')
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'Populate(categories: $categories, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Populate &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PopulateCopyWith<_$_Populate> get copyWith =>
      __$$_PopulateCopyWithImpl<_$_Populate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PopulateToJson(
      this,
    );
  }
}

abstract class _Populate implements Populate {
  const factory _Populate(
      {@JsonKey(name: 'categories')
          required final List<CategoryTrivia> categories,
      @JsonKey(name: 'questions')
          required final List<Question> questions}) = _$_Populate;

  factory _Populate.fromJson(Map<String, dynamic> json) = _$_Populate.fromJson;

  @override
  @JsonKey(name: 'categories')
  List<CategoryTrivia> get categories;
  @override
  @JsonKey(name: 'questions')
  List<Question> get questions;
  @override
  @JsonKey(ignore: true)
  _$$_PopulateCopyWith<_$_Populate> get copyWith =>
      throw _privateConstructorUsedError;
}
