// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teste_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TesteModel _$TesteModelFromJson(Map<String, dynamic> json) {
  return _TesteModel.fromJson(json);
}

/// @nodoc
mixin _$TesteModel {
  int get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  double get points => throw _privateConstructorUsedError;
  ExamModel get exam => throw _privateConstructorUsedError;
  int get studentId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this TesteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TesteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TesteModelCopyWith<TesteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TesteModelCopyWith<$Res> {
  factory $TesteModelCopyWith(
          TesteModel value, $Res Function(TesteModel) then) =
      _$TesteModelCopyWithImpl<$Res, TesteModel>;
  @useResult
  $Res call(
      {int id,
      String status,
      double score,
      double points,
      ExamModel exam,
      int studentId,
      DateTime createdAt});

  $ExamModelCopyWith<$Res> get exam;
}

/// @nodoc
class _$TesteModelCopyWithImpl<$Res, $Val extends TesteModel>
    implements $TesteModelCopyWith<$Res> {
  _$TesteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TesteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? score = null,
    Object? points = null,
    Object? exam = null,
    Object? studentId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as double,
      exam: null == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as ExamModel,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of TesteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExamModelCopyWith<$Res> get exam {
    return $ExamModelCopyWith<$Res>(_value.exam, (value) {
      return _then(_value.copyWith(exam: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TesteModelImplCopyWith<$Res>
    implements $TesteModelCopyWith<$Res> {
  factory _$$TesteModelImplCopyWith(
          _$TesteModelImpl value, $Res Function(_$TesteModelImpl) then) =
      __$$TesteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String status,
      double score,
      double points,
      ExamModel exam,
      int studentId,
      DateTime createdAt});

  @override
  $ExamModelCopyWith<$Res> get exam;
}

/// @nodoc
class __$$TesteModelImplCopyWithImpl<$Res>
    extends _$TesteModelCopyWithImpl<$Res, _$TesteModelImpl>
    implements _$$TesteModelImplCopyWith<$Res> {
  __$$TesteModelImplCopyWithImpl(
      _$TesteModelImpl _value, $Res Function(_$TesteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TesteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? score = null,
    Object? points = null,
    Object? exam = null,
    Object? studentId = null,
    Object? createdAt = null,
  }) {
    return _then(_$TesteModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as double,
      exam: null == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as ExamModel,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TesteModelImpl with DiagnosticableTreeMixin implements _TesteModel {
  const _$TesteModelImpl(
      {required this.id,
      required this.status,
      required this.score,
      required this.points,
      required this.exam,
      required this.studentId,
      required this.createdAt});

  factory _$TesteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TesteModelImplFromJson(json);

  @override
  final int id;
  @override
  final String status;
  @override
  final double score;
  @override
  final double points;
  @override
  final ExamModel exam;
  @override
  final int studentId;
  @override
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TesteModel(id: $id, status: $status, score: $score, points: $points, exam: $exam, studentId: $studentId, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TesteModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('score', score))
      ..add(DiagnosticsProperty('points', points))
      ..add(DiagnosticsProperty('exam', exam))
      ..add(DiagnosticsProperty('studentId', studentId))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TesteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, status, score, points, exam, studentId, createdAt);

  /// Create a copy of TesteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TesteModelImplCopyWith<_$TesteModelImpl> get copyWith =>
      __$$TesteModelImplCopyWithImpl<_$TesteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TesteModelImplToJson(
      this,
    );
  }
}

abstract class _TesteModel implements TesteModel {
  const factory _TesteModel(
      {required final int id,
      required final String status,
      required final double score,
      required final double points,
      required final ExamModel exam,
      required final int studentId,
      required final DateTime createdAt}) = _$TesteModelImpl;

  factory _TesteModel.fromJson(Map<String, dynamic> json) =
      _$TesteModelImpl.fromJson;

  @override
  int get id;
  @override
  String get status;
  @override
  double get score;
  @override
  double get points;
  @override
  ExamModel get exam;
  @override
  int get studentId;
  @override
  DateTime get createdAt;

  /// Create a copy of TesteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TesteModelImplCopyWith<_$TesteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
