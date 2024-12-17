// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dailypoint_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailypointModel _$DailypointModelFromJson(Map<String, dynamic> json) {
  return _DailypointModel.fromJson(json);
}

/// @nodoc
mixin _$DailypointModel {
  int get id => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  int get studentId => throw _privateConstructorUsedError;
  int get classeId => throw _privateConstructorUsedError;
  ClasseModel get classe => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DailypointModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailypointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailypointModelCopyWith<DailypointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailypointModelCopyWith<$Res> {
  factory $DailypointModelCopyWith(
          DailypointModel value, $Res Function(DailypointModel) then) =
      _$DailypointModelCopyWithImpl<$Res, DailypointModel>;
  @useResult
  $Res call(
      {int id,
      int point,
      int studentId,
      int classeId,
      ClasseModel classe,
      DateTime createdAt});

  $ClasseModelCopyWith<$Res> get classe;
}

/// @nodoc
class _$DailypointModelCopyWithImpl<$Res, $Val extends DailypointModel>
    implements $DailypointModelCopyWith<$Res> {
  _$DailypointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailypointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? point = null,
    Object? studentId = null,
    Object? classeId = null,
    Object? classe = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      classeId: null == classeId
          ? _value.classeId
          : classeId // ignore: cast_nullable_to_non_nullable
              as int,
      classe: null == classe
          ? _value.classe
          : classe // ignore: cast_nullable_to_non_nullable
              as ClasseModel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of DailypointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClasseModelCopyWith<$Res> get classe {
    return $ClasseModelCopyWith<$Res>(_value.classe, (value) {
      return _then(_value.copyWith(classe: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DailypointModelImplCopyWith<$Res>
    implements $DailypointModelCopyWith<$Res> {
  factory _$$DailypointModelImplCopyWith(_$DailypointModelImpl value,
          $Res Function(_$DailypointModelImpl) then) =
      __$$DailypointModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int point,
      int studentId,
      int classeId,
      ClasseModel classe,
      DateTime createdAt});

  @override
  $ClasseModelCopyWith<$Res> get classe;
}

/// @nodoc
class __$$DailypointModelImplCopyWithImpl<$Res>
    extends _$DailypointModelCopyWithImpl<$Res, _$DailypointModelImpl>
    implements _$$DailypointModelImplCopyWith<$Res> {
  __$$DailypointModelImplCopyWithImpl(
      _$DailypointModelImpl _value, $Res Function(_$DailypointModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailypointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? point = null,
    Object? studentId = null,
    Object? classeId = null,
    Object? classe = null,
    Object? createdAt = null,
  }) {
    return _then(_$DailypointModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int,
      classeId: null == classeId
          ? _value.classeId
          : classeId // ignore: cast_nullable_to_non_nullable
              as int,
      classe: null == classe
          ? _value.classe
          : classe // ignore: cast_nullable_to_non_nullable
              as ClasseModel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailypointModelImpl
    with DiagnosticableTreeMixin
    implements _DailypointModel {
  const _$DailypointModelImpl(
      {required this.id,
      required this.point,
      required this.studentId,
      required this.classeId,
      required this.classe,
      required this.createdAt});

  factory _$DailypointModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailypointModelImplFromJson(json);

  @override
  final int id;
  @override
  final int point;
  @override
  final int studentId;
  @override
  final int classeId;
  @override
  final ClasseModel classe;
  @override
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DailypointModel(id: $id, point: $point, studentId: $studentId, classeId: $classeId, classe: $classe, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DailypointModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('point', point))
      ..add(DiagnosticsProperty('studentId', studentId))
      ..add(DiagnosticsProperty('classeId', classeId))
      ..add(DiagnosticsProperty('classe', classe))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailypointModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.classeId, classeId) ||
                other.classeId == classeId) &&
            (identical(other.classe, classe) || other.classe == classe) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, point, studentId, classeId, classe, createdAt);

  /// Create a copy of DailypointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailypointModelImplCopyWith<_$DailypointModelImpl> get copyWith =>
      __$$DailypointModelImplCopyWithImpl<_$DailypointModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailypointModelImplToJson(
      this,
    );
  }
}

abstract class _DailypointModel implements DailypointModel {
  const factory _DailypointModel(
      {required final int id,
      required final int point,
      required final int studentId,
      required final int classeId,
      required final ClasseModel classe,
      required final DateTime createdAt}) = _$DailypointModelImpl;

  factory _DailypointModel.fromJson(Map<String, dynamic> json) =
      _$DailypointModelImpl.fromJson;

  @override
  int get id;
  @override
  int get point;
  @override
  int get studentId;
  @override
  int get classeId;
  @override
  ClasseModel get classe;
  @override
  DateTime get createdAt;

  /// Create a copy of DailypointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailypointModelImplCopyWith<_$DailypointModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
