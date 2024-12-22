// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dailypoint_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailypointReportModel _$DailypointReportModelFromJson(
    Map<String, dynamic> json) {
  return _DailypointReportModel.fromJson(json);
}

/// @nodoc
mixin _$DailypointReportModel {
  int get countAll => throw _privateConstructorUsedError;
  double get average => throw _privateConstructorUsedError;
  dynamic get attributes => throw _privateConstructorUsedError;

  /// Serializes this DailypointReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailypointReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailypointReportModelCopyWith<DailypointReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailypointReportModelCopyWith<$Res> {
  factory $DailypointReportModelCopyWith(DailypointReportModel value,
          $Res Function(DailypointReportModel) then) =
      _$DailypointReportModelCopyWithImpl<$Res, DailypointReportModel>;
  @useResult
  $Res call({int countAll, double average, dynamic attributes});
}

/// @nodoc
class _$DailypointReportModelCopyWithImpl<$Res,
        $Val extends DailypointReportModel>
    implements $DailypointReportModelCopyWith<$Res> {
  _$DailypointReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailypointReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countAll = null,
    Object? average = null,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      countAll: null == countAll
          ? _value.countAll
          : countAll // ignore: cast_nullable_to_non_nullable
              as int,
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailypointReportModelImplCopyWith<$Res>
    implements $DailypointReportModelCopyWith<$Res> {
  factory _$$DailypointReportModelImplCopyWith(
          _$DailypointReportModelImpl value,
          $Res Function(_$DailypointReportModelImpl) then) =
      __$$DailypointReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int countAll, double average, dynamic attributes});
}

/// @nodoc
class __$$DailypointReportModelImplCopyWithImpl<$Res>
    extends _$DailypointReportModelCopyWithImpl<$Res,
        _$DailypointReportModelImpl>
    implements _$$DailypointReportModelImplCopyWith<$Res> {
  __$$DailypointReportModelImplCopyWithImpl(_$DailypointReportModelImpl _value,
      $Res Function(_$DailypointReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailypointReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countAll = null,
    Object? average = null,
    Object? attributes = freezed,
  }) {
    return _then(_$DailypointReportModelImpl(
      countAll: null == countAll
          ? _value.countAll
          : countAll // ignore: cast_nullable_to_non_nullable
              as int,
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
      attributes: freezed == attributes ? _value.attributes! : attributes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailypointReportModelImpl
    with DiagnosticableTreeMixin
    implements _DailypointReportModel {
  const _$DailypointReportModelImpl(
      {required this.countAll, required this.average, this.attributes});

  factory _$DailypointReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailypointReportModelImplFromJson(json);

  @override
  final int countAll;
  @override
  final double average;
  @override
  final dynamic attributes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DailypointReportModel(countAll: $countAll, average: $average, attributes: $attributes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DailypointReportModel'))
      ..add(DiagnosticsProperty('countAll', countAll))
      ..add(DiagnosticsProperty('average', average))
      ..add(DiagnosticsProperty('attributes', attributes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailypointReportModelImpl &&
            (identical(other.countAll, countAll) ||
                other.countAll == countAll) &&
            (identical(other.average, average) || other.average == average) &&
            const DeepCollectionEquality()
                .equals(other.attributes, attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, countAll, average,
      const DeepCollectionEquality().hash(attributes));

  /// Create a copy of DailypointReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailypointReportModelImplCopyWith<_$DailypointReportModelImpl>
      get copyWith => __$$DailypointReportModelImplCopyWithImpl<
          _$DailypointReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailypointReportModelImplToJson(
      this,
    );
  }
}

abstract class _DailypointReportModel implements DailypointReportModel {
  const factory _DailypointReportModel(
      {required final int countAll,
      required final double average,
      final dynamic attributes}) = _$DailypointReportModelImpl;

  factory _DailypointReportModel.fromJson(Map<String, dynamic> json) =
      _$DailypointReportModelImpl.fromJson;

  @override
  int get countAll;
  @override
  double get average;
  @override
  dynamic get attributes;

  /// Create a copy of DailypointReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailypointReportModelImplCopyWith<_$DailypointReportModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
