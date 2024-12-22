// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return _QuestionModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionModel {
  int get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get correctLine => throw _privateConstructorUsedError;
  List<AnswerModel> get answers => throw _privateConstructorUsedError;
  int get examId => throw _privateConstructorUsedError;
  int get answerId => throw _privateConstructorUsedError;

  /// Serializes this QuestionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) then) =
      _$QuestionModelCopyWithImpl<$Res, QuestionModel>;
  @useResult
  $Res call(
      {int id,
      String question,
      String correctLine,
      List<AnswerModel> answers,
      int examId,
      int answerId});
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res, $Val extends QuestionModel>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? correctLine = null,
    Object? answers = null,
    Object? examId = null,
    Object? answerId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      correctLine: null == correctLine
          ? _value.correctLine
          : correctLine // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerModel>,
      examId: null == examId
          ? _value.examId
          : examId // ignore: cast_nullable_to_non_nullable
              as int,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionModelImplCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$$QuestionModelImplCopyWith(
          _$QuestionModelImpl value, $Res Function(_$QuestionModelImpl) then) =
      __$$QuestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String question,
      String correctLine,
      List<AnswerModel> answers,
      int examId,
      int answerId});
}

/// @nodoc
class __$$QuestionModelImplCopyWithImpl<$Res>
    extends _$QuestionModelCopyWithImpl<$Res, _$QuestionModelImpl>
    implements _$$QuestionModelImplCopyWith<$Res> {
  __$$QuestionModelImplCopyWithImpl(
      _$QuestionModelImpl _value, $Res Function(_$QuestionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? correctLine = null,
    Object? answers = null,
    Object? examId = null,
    Object? answerId = null,
  }) {
    return _then(_$QuestionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      correctLine: null == correctLine
          ? _value.correctLine
          : correctLine // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerModel>,
      examId: null == examId
          ? _value.examId
          : examId // ignore: cast_nullable_to_non_nullable
              as int,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionModelImpl
    with DiagnosticableTreeMixin
    implements _QuestionModel {
  const _$QuestionModelImpl(
      {required this.id,
      required this.question,
      required this.correctLine,
      required final List<AnswerModel> answers,
      required this.examId,
      required this.answerId})
      : _answers = answers;

  factory _$QuestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String question;
  @override
  final String correctLine;
  final List<AnswerModel> _answers;
  @override
  List<AnswerModel> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final int examId;
  @override
  final int answerId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionModel(id: $id, question: $question, correctLine: $correctLine, answers: $answers, examId: $examId, answerId: $answerId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('correctLine', correctLine))
      ..add(DiagnosticsProperty('answers', answers))
      ..add(DiagnosticsProperty('examId', examId))
      ..add(DiagnosticsProperty('answerId', answerId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.correctLine, correctLine) ||
                other.correctLine == correctLine) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.examId, examId) || other.examId == examId) &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, correctLine,
      const DeepCollectionEquality().hash(_answers), examId, answerId);

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionModelImplCopyWith<_$QuestionModelImpl> get copyWith =>
      __$$QuestionModelImplCopyWithImpl<_$QuestionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionModelImplToJson(
      this,
    );
  }
}

abstract class _QuestionModel implements QuestionModel {
  const factory _QuestionModel(
      {required final int id,
      required final String question,
      required final String correctLine,
      required final List<AnswerModel> answers,
      required final int examId,
      required final int answerId}) = _$QuestionModelImpl;

  factory _QuestionModel.fromJson(Map<String, dynamic> json) =
      _$QuestionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get question;
  @override
  String get correctLine;
  @override
  List<AnswerModel> get answers;
  @override
  int get examId;
  @override
  int get answerId;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionModelImplCopyWith<_$QuestionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
