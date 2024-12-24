// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teste_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TesteReportModel _$TesteReportModelFromJson(Map<String, dynamic> json) {
  return _TesteReportModel.fromJson(json);
}

/// @nodoc
mixin _$TesteReportModel {
  double get average => throw _privateConstructorUsedError;
  List<TesteModel> get testes => throw _privateConstructorUsedError;
  dynamic get attributes => throw _privateConstructorUsedError;

  /// Serializes this TesteReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TesteReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TesteReportModelCopyWith<TesteReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TesteReportModelCopyWith<$Res> {
  factory $TesteReportModelCopyWith(
          TesteReportModel value, $Res Function(TesteReportModel) then) =
      _$TesteReportModelCopyWithImpl<$Res, TesteReportModel>;
  @useResult
  $Res call({double average, List<TesteModel> testes, dynamic attributes});
}

/// @nodoc
class _$TesteReportModelCopyWithImpl<$Res, $Val extends TesteReportModel>
    implements $TesteReportModelCopyWith<$Res> {
  _$TesteReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TesteReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? average = null,
    Object? testes = null,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
      testes: null == testes
          ? _value.testes
          : testes // ignore: cast_nullable_to_non_nullable
              as List<TesteModel>,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TesteReportModelImplCopyWith<$Res>
    implements $TesteReportModelCopyWith<$Res> {
  factory _$$TesteReportModelImplCopyWith(_$TesteReportModelImpl value,
          $Res Function(_$TesteReportModelImpl) then) =
      __$$TesteReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double average, List<TesteModel> testes, dynamic attributes});
}

/// @nodoc
class __$$TesteReportModelImplCopyWithImpl<$Res>
    extends _$TesteReportModelCopyWithImpl<$Res, _$TesteReportModelImpl>
    implements _$$TesteReportModelImplCopyWith<$Res> {
  __$$TesteReportModelImplCopyWithImpl(_$TesteReportModelImpl _value,
      $Res Function(_$TesteReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TesteReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? average = null,
    Object? testes = null,
    Object? attributes = freezed,
  }) {
    return _then(_$TesteReportModelImpl(
      average: null == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
      testes: null == testes
          ? _value._testes
          : testes // ignore: cast_nullable_to_non_nullable
              as List<TesteModel>,
      attributes: freezed == attributes ? _value.attributes! : attributes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TesteReportModelImpl
    with DiagnosticableTreeMixin
    implements _TesteReportModel {
  const _$TesteReportModelImpl(
      {required this.average,
      required final List<TesteModel> testes,
      this.attributes})
      : _testes = testes;

  factory _$TesteReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TesteReportModelImplFromJson(json);

  @override
  final double average;
  final List<TesteModel> _testes;
  @override
  List<TesteModel> get testes {
    if (_testes is EqualUnmodifiableListView) return _testes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_testes);
  }

  @override
  final dynamic attributes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TesteReportModel(average: $average, testes: $testes, attributes: $attributes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TesteReportModel'))
      ..add(DiagnosticsProperty('average', average))
      ..add(DiagnosticsProperty('testes', testes))
      ..add(DiagnosticsProperty('attributes', attributes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TesteReportModelImpl &&
            (identical(other.average, average) || other.average == average) &&
            const DeepCollectionEquality().equals(other._testes, _testes) &&
            const DeepCollectionEquality()
                .equals(other.attributes, attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      average,
      const DeepCollectionEquality().hash(_testes),
      const DeepCollectionEquality().hash(attributes));

  /// Create a copy of TesteReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TesteReportModelImplCopyWith<_$TesteReportModelImpl> get copyWith =>
      __$$TesteReportModelImplCopyWithImpl<_$TesteReportModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TesteReportModelImplToJson(
      this,
    );
  }
}

abstract class _TesteReportModel implements TesteReportModel {
  const factory _TesteReportModel(
      {required final double average,
      required final List<TesteModel> testes,
      final dynamic attributes}) = _$TesteReportModelImpl;

  factory _TesteReportModel.fromJson(Map<String, dynamic> json) =
      _$TesteReportModelImpl.fromJson;

  @override
  double get average;
  @override
  List<TesteModel> get testes;
  @override
  dynamic get attributes;

  /// Create a copy of TesteReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TesteReportModelImplCopyWith<_$TesteReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
