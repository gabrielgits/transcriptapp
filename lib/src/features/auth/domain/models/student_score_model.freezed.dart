// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_score_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentScoreModel _$StudentScoreModelFromJson(Map<String, dynamic> json) {
  return _StudentScoreModel.fromJson(json);
}

/// @nodoc
mixin _$StudentScoreModel {
  double get testesAverage => throw _privateConstructorUsedError;
  double get attendancesPercent => throw _privateConstructorUsedError;
  double get dailypointsAverageFinal => throw _privateConstructorUsedError;
  double get finalAverage => throw _privateConstructorUsedError;

  /// Serializes this StudentScoreModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentScoreModelCopyWith<StudentScoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentScoreModelCopyWith<$Res> {
  factory $StudentScoreModelCopyWith(
          StudentScoreModel value, $Res Function(StudentScoreModel) then) =
      _$StudentScoreModelCopyWithImpl<$Res, StudentScoreModel>;
  @useResult
  $Res call(
      {double testesAverage,
      double attendancesPercent,
      double dailypointsAverageFinal,
      double finalAverage});
}

/// @nodoc
class _$StudentScoreModelCopyWithImpl<$Res, $Val extends StudentScoreModel>
    implements $StudentScoreModelCopyWith<$Res> {
  _$StudentScoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testesAverage = null,
    Object? attendancesPercent = null,
    Object? dailypointsAverageFinal = null,
    Object? finalAverage = null,
  }) {
    return _then(_value.copyWith(
      testesAverage: null == testesAverage
          ? _value.testesAverage
          : testesAverage // ignore: cast_nullable_to_non_nullable
              as double,
      attendancesPercent: null == attendancesPercent
          ? _value.attendancesPercent
          : attendancesPercent // ignore: cast_nullable_to_non_nullable
              as double,
      dailypointsAverageFinal: null == dailypointsAverageFinal
          ? _value.dailypointsAverageFinal
          : dailypointsAverageFinal // ignore: cast_nullable_to_non_nullable
              as double,
      finalAverage: null == finalAverage
          ? _value.finalAverage
          : finalAverage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentScoreModelImplCopyWith<$Res>
    implements $StudentScoreModelCopyWith<$Res> {
  factory _$$StudentScoreModelImplCopyWith(_$StudentScoreModelImpl value,
          $Res Function(_$StudentScoreModelImpl) then) =
      __$$StudentScoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double testesAverage,
      double attendancesPercent,
      double dailypointsAverageFinal,
      double finalAverage});
}

/// @nodoc
class __$$StudentScoreModelImplCopyWithImpl<$Res>
    extends _$StudentScoreModelCopyWithImpl<$Res, _$StudentScoreModelImpl>
    implements _$$StudentScoreModelImplCopyWith<$Res> {
  __$$StudentScoreModelImplCopyWithImpl(_$StudentScoreModelImpl _value,
      $Res Function(_$StudentScoreModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testesAverage = null,
    Object? attendancesPercent = null,
    Object? dailypointsAverageFinal = null,
    Object? finalAverage = null,
  }) {
    return _then(_$StudentScoreModelImpl(
      testesAverage: null == testesAverage
          ? _value.testesAverage
          : testesAverage // ignore: cast_nullable_to_non_nullable
              as double,
      attendancesPercent: null == attendancesPercent
          ? _value.attendancesPercent
          : attendancesPercent // ignore: cast_nullable_to_non_nullable
              as double,
      dailypointsAverageFinal: null == dailypointsAverageFinal
          ? _value.dailypointsAverageFinal
          : dailypointsAverageFinal // ignore: cast_nullable_to_non_nullable
              as double,
      finalAverage: null == finalAverage
          ? _value.finalAverage
          : finalAverage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentScoreModelImpl
    with DiagnosticableTreeMixin
    implements _StudentScoreModel {
  const _$StudentScoreModelImpl(
      {required this.testesAverage,
      required this.attendancesPercent,
      required this.dailypointsAverageFinal,
      required this.finalAverage});

  factory _$StudentScoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentScoreModelImplFromJson(json);

  @override
  final double testesAverage;
  @override
  final double attendancesPercent;
  @override
  final double dailypointsAverageFinal;
  @override
  final double finalAverage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StudentScoreModel(testesAverage: $testesAverage, attendancesPercent: $attendancesPercent, dailypointsAverageFinal: $dailypointsAverageFinal, finalAverage: $finalAverage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StudentScoreModel'))
      ..add(DiagnosticsProperty('testesAverage', testesAverage))
      ..add(DiagnosticsProperty('attendancesPercent', attendancesPercent))
      ..add(DiagnosticsProperty(
          'dailypointsAverageFinal', dailypointsAverageFinal))
      ..add(DiagnosticsProperty('finalAverage', finalAverage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentScoreModelImpl &&
            (identical(other.testesAverage, testesAverage) ||
                other.testesAverage == testesAverage) &&
            (identical(other.attendancesPercent, attendancesPercent) ||
                other.attendancesPercent == attendancesPercent) &&
            (identical(
                    other.dailypointsAverageFinal, dailypointsAverageFinal) ||
                other.dailypointsAverageFinal == dailypointsAverageFinal) &&
            (identical(other.finalAverage, finalAverage) ||
                other.finalAverage == finalAverage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, testesAverage,
      attendancesPercent, dailypointsAverageFinal, finalAverage);

  /// Create a copy of StudentScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentScoreModelImplCopyWith<_$StudentScoreModelImpl> get copyWith =>
      __$$StudentScoreModelImplCopyWithImpl<_$StudentScoreModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentScoreModelImplToJson(
      this,
    );
  }
}

abstract class _StudentScoreModel implements StudentScoreModel {
  const factory _StudentScoreModel(
      {required final double testesAverage,
      required final double attendancesPercent,
      required final double dailypointsAverageFinal,
      required final double finalAverage}) = _$StudentScoreModelImpl;

  factory _StudentScoreModel.fromJson(Map<String, dynamic> json) =
      _$StudentScoreModelImpl.fromJson;

  @override
  double get testesAverage;
  @override
  double get attendancesPercent;
  @override
  double get dailypointsAverageFinal;
  @override
  double get finalAverage;

  /// Create a copy of StudentScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentScoreModelImplCopyWith<_$StudentScoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
