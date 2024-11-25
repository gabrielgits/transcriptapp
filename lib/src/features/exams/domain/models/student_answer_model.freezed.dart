// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_answer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentAnswerModel _$StudentAnswerModelFromJson(Map<String, dynamic> json) {
  return _StudentAnswerModel.fromJson(json);
}

/// @nodoc
mixin _$StudentAnswerModel {
  int get id => throw _privateConstructorUsedError;
  int get studentId => throw _privateConstructorUsedError;
  QuestionModel get question => throw _privateConstructorUsedError;
  AnswerModel get answer => throw _privateConstructorUsedError;
  int get testeId => throw _privateConstructorUsedError;

  /// Serializes this StudentAnswerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentAnswerModelCopyWith<StudentAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentAnswerModelCopyWith<$Res> {
  factory $StudentAnswerModelCopyWith(
          StudentAnswerModel value, $Res Function(StudentAnswerModel) then) =
      _$StudentAnswerModelCopyWithImpl<$Res, StudentAnswerModel>;
  @useResult
  $Res call(
      {int id,
      int studentId,
      QuestionModel question,
      AnswerModel answer,
      int testeId});

  $QuestionModelCopyWith<$Res> get question;
  $AnswerModelCopyWith<$Res> get answer;
}

/// @nodoc
class _$StudentAnswerModelCopyWithImpl<$Res, $Val extends StudentAnswerModel>
    implements $StudentAnswerModelCopyWith<$Res> {
  _$StudentAnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? studentId = null,
    Object? question = null,
    Object? answer = null,
    Object? testeId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as QuestionModel,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as AnswerModel,
      testeId: null == testeId
          ? _value.testeId
          : testeId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of StudentAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestionModelCopyWith<$Res> get question {
    return $QuestionModelCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value) as $Val);
    });
  }

  /// Create a copy of StudentAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnswerModelCopyWith<$Res> get answer {
    return $AnswerModelCopyWith<$Res>(_value.answer, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentAnswerModelImplCopyWith<$Res>
    implements $StudentAnswerModelCopyWith<$Res> {
  factory _$$StudentAnswerModelImplCopyWith(_$StudentAnswerModelImpl value,
          $Res Function(_$StudentAnswerModelImpl) then) =
      __$$StudentAnswerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int studentId,
      QuestionModel question,
      AnswerModel answer,
      int testeId});

  @override
  $QuestionModelCopyWith<$Res> get question;
  @override
  $AnswerModelCopyWith<$Res> get answer;
}

/// @nodoc
class __$$StudentAnswerModelImplCopyWithImpl<$Res>
    extends _$StudentAnswerModelCopyWithImpl<$Res, _$StudentAnswerModelImpl>
    implements _$$StudentAnswerModelImplCopyWith<$Res> {
  __$$StudentAnswerModelImplCopyWithImpl(_$StudentAnswerModelImpl _value,
      $Res Function(_$StudentAnswerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? studentId = null,
    Object? question = null,
    Object? answer = null,
    Object? testeId = null,
  }) {
    return _then(_$StudentAnswerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as QuestionModel,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as AnswerModel,
      testeId: null == testeId
          ? _value.testeId
          : testeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentAnswerModelImpl
    with DiagnosticableTreeMixin
    implements _StudentAnswerModel {
  const _$StudentAnswerModelImpl(
      {required this.id,
      required this.studentId,
      required this.question,
      required this.answer,
      required this.testeId});

  factory _$StudentAnswerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentAnswerModelImplFromJson(json);

  @override
  final int id;
  @override
  final int studentId;
  @override
  final QuestionModel question;
  @override
  final AnswerModel answer;
  @override
  final int testeId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StudentAnswerModel(id: $id, studentId: $studentId, question: $question, answer: $answer, testeId: $testeId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StudentAnswerModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('studentId', studentId))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('answer', answer))
      ..add(DiagnosticsProperty('testeId', testeId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentAnswerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.testeId, testeId) || other.testeId == testeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, studentId, question, answer, testeId);

  /// Create a copy of StudentAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentAnswerModelImplCopyWith<_$StudentAnswerModelImpl> get copyWith =>
      __$$StudentAnswerModelImplCopyWithImpl<_$StudentAnswerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentAnswerModelImplToJson(
      this,
    );
  }
}

abstract class _StudentAnswerModel implements StudentAnswerModel {
  const factory _StudentAnswerModel(
      {required final int id,
      required final int studentId,
      required final QuestionModel question,
      required final AnswerModel answer,
      required final int testeId}) = _$StudentAnswerModelImpl;

  factory _StudentAnswerModel.fromJson(Map<String, dynamic> json) =
      _$StudentAnswerModelImpl.fromJson;

  @override
  int get id;
  @override
  int get studentId;
  @override
  QuestionModel get question;
  @override
  AnswerModel get answer;
  @override
  int get testeId;

  /// Create a copy of StudentAnswerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentAnswerModelImplCopyWith<_$StudentAnswerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
