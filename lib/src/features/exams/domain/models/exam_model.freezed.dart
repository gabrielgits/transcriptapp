// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExamModel _$ExamModelFromJson(Map<String, dynamic> json) {
  return _ExamModel.fromJson(json);
}

/// @nodoc
mixin _$ExamModel {
  int get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get classe => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ExamModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamModelCopyWith<ExamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamModelCopyWith<$Res> {
  factory $ExamModelCopyWith(ExamModel value, $Res Function(ExamModel) then) =
      _$ExamModelCopyWithImpl<$Res, ExamModel>;
  @useResult
  $Res call({int id, String status, String classe, DateTime createdAt});
}

/// @nodoc
class _$ExamModelCopyWithImpl<$Res, $Val extends ExamModel>
    implements $ExamModelCopyWith<$Res> {
  _$ExamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? classe = null,
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
      classe: null == classe
          ? _value.classe
          : classe // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExamModelImplCopyWith<$Res>
    implements $ExamModelCopyWith<$Res> {
  factory _$$ExamModelImplCopyWith(
          _$ExamModelImpl value, $Res Function(_$ExamModelImpl) then) =
      __$$ExamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String status, String classe, DateTime createdAt});
}

/// @nodoc
class __$$ExamModelImplCopyWithImpl<$Res>
    extends _$ExamModelCopyWithImpl<$Res, _$ExamModelImpl>
    implements _$$ExamModelImplCopyWith<$Res> {
  __$$ExamModelImplCopyWithImpl(
      _$ExamModelImpl _value, $Res Function(_$ExamModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? classe = null,
    Object? createdAt = null,
  }) {
    return _then(_$ExamModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      classe: null == classe
          ? _value.classe
          : classe // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamModelImpl with DiagnosticableTreeMixin implements _ExamModel {
  const _$ExamModelImpl(
      {required this.id,
      required this.status,
      required this.classe,
      required this.createdAt});

  factory _$ExamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamModelImplFromJson(json);

  @override
  final int id;
  @override
  final String status;
  @override
  final String classe;
  @override
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExamModel(id: $id, status: $status, classe: $classe, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExamModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('classe', classe))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.classe, classe) || other.classe == classe) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, classe, createdAt);

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamModelImplCopyWith<_$ExamModelImpl> get copyWith =>
      __$$ExamModelImplCopyWithImpl<_$ExamModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamModelImplToJson(
      this,
    );
  }
}

abstract class _ExamModel implements ExamModel {
  const factory _ExamModel(
      {required final int id,
      required final String status,
      required final String classe,
      required final DateTime createdAt}) = _$ExamModelImpl;

  factory _ExamModel.fromJson(Map<String, dynamic> json) =
      _$ExamModelImpl.fromJson;

  @override
  int get id;
  @override
  String get status;
  @override
  String get classe;
  @override
  DateTime get createdAt;

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamModelImplCopyWith<_$ExamModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
