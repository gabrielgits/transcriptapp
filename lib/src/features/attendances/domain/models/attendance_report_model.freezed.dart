// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceReportModel _$AttendanceReportModelFromJson(
    Map<String, dynamic> json) {
  return _AttendanceReportModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceReportModel {
  double get percent => throw _privateConstructorUsedError;
  int get countAll => throw _privateConstructorUsedError;
  int get countPresent => throw _privateConstructorUsedError;
  int get countAbsent => throw _privateConstructorUsedError;
  dynamic get attributes => throw _privateConstructorUsedError;

  /// Serializes this AttendanceReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceReportModelCopyWith<AttendanceReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceReportModelCopyWith<$Res> {
  factory $AttendanceReportModelCopyWith(AttendanceReportModel value,
          $Res Function(AttendanceReportModel) then) =
      _$AttendanceReportModelCopyWithImpl<$Res, AttendanceReportModel>;
  @useResult
  $Res call(
      {double percent,
      int countAll,
      int countPresent,
      int countAbsent,
      dynamic attributes});
}

/// @nodoc
class _$AttendanceReportModelCopyWithImpl<$Res,
        $Val extends AttendanceReportModel>
    implements $AttendanceReportModelCopyWith<$Res> {
  _$AttendanceReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percent = null,
    Object? countAll = null,
    Object? countPresent = null,
    Object? countAbsent = null,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
      countAll: null == countAll
          ? _value.countAll
          : countAll // ignore: cast_nullable_to_non_nullable
              as int,
      countPresent: null == countPresent
          ? _value.countPresent
          : countPresent // ignore: cast_nullable_to_non_nullable
              as int,
      countAbsent: null == countAbsent
          ? _value.countAbsent
          : countAbsent // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceReportModelImplCopyWith<$Res>
    implements $AttendanceReportModelCopyWith<$Res> {
  factory _$$AttendanceReportModelImplCopyWith(
          _$AttendanceReportModelImpl value,
          $Res Function(_$AttendanceReportModelImpl) then) =
      __$$AttendanceReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double percent,
      int countAll,
      int countPresent,
      int countAbsent,
      dynamic attributes});
}

/// @nodoc
class __$$AttendanceReportModelImplCopyWithImpl<$Res>
    extends _$AttendanceReportModelCopyWithImpl<$Res,
        _$AttendanceReportModelImpl>
    implements _$$AttendanceReportModelImplCopyWith<$Res> {
  __$$AttendanceReportModelImplCopyWithImpl(_$AttendanceReportModelImpl _value,
      $Res Function(_$AttendanceReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percent = null,
    Object? countAll = null,
    Object? countPresent = null,
    Object? countAbsent = null,
    Object? attributes = freezed,
  }) {
    return _then(_$AttendanceReportModelImpl(
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
      countAll: null == countAll
          ? _value.countAll
          : countAll // ignore: cast_nullable_to_non_nullable
              as int,
      countPresent: null == countPresent
          ? _value.countPresent
          : countPresent // ignore: cast_nullable_to_non_nullable
              as int,
      countAbsent: null == countAbsent
          ? _value.countAbsent
          : countAbsent // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: freezed == attributes ? _value.attributes! : attributes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceReportModelImpl
    with DiagnosticableTreeMixin
    implements _AttendanceReportModel {
  const _$AttendanceReportModelImpl(
      {required this.percent,
      required this.countAll,
      required this.countPresent,
      required this.countAbsent,
      this.attributes});

  factory _$AttendanceReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceReportModelImplFromJson(json);

  @override
  final double percent;
  @override
  final int countAll;
  @override
  final int countPresent;
  @override
  final int countAbsent;
  @override
  final dynamic attributes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AttendanceReportModel(percent: $percent, countAll: $countAll, countPresent: $countPresent, countAbsent: $countAbsent, attributes: $attributes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AttendanceReportModel'))
      ..add(DiagnosticsProperty('percent', percent))
      ..add(DiagnosticsProperty('countAll', countAll))
      ..add(DiagnosticsProperty('countPresent', countPresent))
      ..add(DiagnosticsProperty('countAbsent', countAbsent))
      ..add(DiagnosticsProperty('attributes', attributes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceReportModelImpl &&
            (identical(other.percent, percent) || other.percent == percent) &&
            (identical(other.countAll, countAll) ||
                other.countAll == countAll) &&
            (identical(other.countPresent, countPresent) ||
                other.countPresent == countPresent) &&
            (identical(other.countAbsent, countAbsent) ||
                other.countAbsent == countAbsent) &&
            const DeepCollectionEquality()
                .equals(other.attributes, attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, percent, countAll, countPresent,
      countAbsent, const DeepCollectionEquality().hash(attributes));

  /// Create a copy of AttendanceReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceReportModelImplCopyWith<_$AttendanceReportModelImpl>
      get copyWith => __$$AttendanceReportModelImplCopyWithImpl<
          _$AttendanceReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceReportModelImplToJson(
      this,
    );
  }
}

abstract class _AttendanceReportModel implements AttendanceReportModel {
  const factory _AttendanceReportModel(
      {required final double percent,
      required final int countAll,
      required final int countPresent,
      required final int countAbsent,
      final dynamic attributes}) = _$AttendanceReportModelImpl;

  factory _AttendanceReportModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceReportModelImpl.fromJson;

  @override
  double get percent;
  @override
  int get countAll;
  @override
  int get countPresent;
  @override
  int get countAbsent;
  @override
  dynamic get attributes;

  /// Create a copy of AttendanceReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceReportModelImplCopyWith<_$AttendanceReportModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
