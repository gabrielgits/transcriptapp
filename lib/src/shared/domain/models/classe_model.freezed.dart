// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'classe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClasseModel _$ClasseModelFromJson(Map<String, dynamic> json) {
  return _ClasseModel.fromJson(json);
}

/// @nodoc
mixin _$ClasseModel {
  int get id => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  int get courseId => throw _privateConstructorUsedError;

  /// Serializes this ClasseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClasseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClasseModelCopyWith<ClasseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClasseModelCopyWith<$Res> {
  factory $ClasseModelCopyWith(
          ClasseModel value, $Res Function(ClasseModel) then) =
      _$ClasseModelCopyWithImpl<$Res, ClasseModel>;
  @useResult
  $Res call({int id, String summary, int courseId});
}

/// @nodoc
class _$ClasseModelCopyWithImpl<$Res, $Val extends ClasseModel>
    implements $ClasseModelCopyWith<$Res> {
  _$ClasseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClasseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? summary = null,
    Object? courseId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClasseModelImplCopyWith<$Res>
    implements $ClasseModelCopyWith<$Res> {
  factory _$$ClasseModelImplCopyWith(
          _$ClasseModelImpl value, $Res Function(_$ClasseModelImpl) then) =
      __$$ClasseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String summary, int courseId});
}

/// @nodoc
class __$$ClasseModelImplCopyWithImpl<$Res>
    extends _$ClasseModelCopyWithImpl<$Res, _$ClasseModelImpl>
    implements _$$ClasseModelImplCopyWith<$Res> {
  __$$ClasseModelImplCopyWithImpl(
      _$ClasseModelImpl _value, $Res Function(_$ClasseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClasseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? summary = null,
    Object? courseId = null,
  }) {
    return _then(_$ClasseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClasseModelImpl with DiagnosticableTreeMixin implements _ClasseModel {
  const _$ClasseModelImpl(
      {required this.id, required this.summary, required this.courseId});

  factory _$ClasseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClasseModelImplFromJson(json);

  @override
  final int id;
  @override
  final String summary;
  @override
  final int courseId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClasseModel(id: $id, summary: $summary, courseId: $courseId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClasseModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('summary', summary))
      ..add(DiagnosticsProperty('courseId', courseId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClasseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, summary, courseId);

  /// Create a copy of ClasseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClasseModelImplCopyWith<_$ClasseModelImpl> get copyWith =>
      __$$ClasseModelImplCopyWithImpl<_$ClasseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClasseModelImplToJson(
      this,
    );
  }
}

abstract class _ClasseModel implements ClasseModel {
  const factory _ClasseModel(
      {required final int id,
      required final String summary,
      required final int courseId}) = _$ClasseModelImpl;

  factory _ClasseModel.fromJson(Map<String, dynamic> json) =
      _$ClasseModelImpl.fromJson;

  @override
  int get id;
  @override
  String get summary;
  @override
  int get courseId;

  /// Create a copy of ClasseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClasseModelImplCopyWith<_$ClasseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}