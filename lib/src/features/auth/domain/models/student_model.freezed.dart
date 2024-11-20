// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) {
  return _StudentModel.fromJson(json);
}

/// @nodoc
mixin _$StudentModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  /// Serializes this StudentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentModelCopyWith<StudentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentModelCopyWith<$Res> {
  factory $StudentModelCopyWith(
          StudentModel value, $Res Function(StudentModel) then) =
      _$StudentModelCopyWithImpl<$Res, StudentModel>;
  @useResult
  $Res call({int id, String name, String phone, String photo, int status});
}

/// @nodoc
class _$StudentModelCopyWithImpl<$Res, $Val extends StudentModel>
    implements $StudentModelCopyWith<$Res> {
  _$StudentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? photo = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentModelImplCopyWith<$Res>
    implements $StudentModelCopyWith<$Res> {
  factory _$$StudentModelImplCopyWith(
          _$StudentModelImpl value, $Res Function(_$StudentModelImpl) then) =
      __$$StudentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String phone, String photo, int status});
}

/// @nodoc
class __$$StudentModelImplCopyWithImpl<$Res>
    extends _$StudentModelCopyWithImpl<$Res, _$StudentModelImpl>
    implements _$$StudentModelImplCopyWith<$Res> {
  __$$StudentModelImplCopyWithImpl(
      _$StudentModelImpl _value, $Res Function(_$StudentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? photo = null,
    Object? status = null,
  }) {
    return _then(_$StudentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentModelImpl with DiagnosticableTreeMixin implements _StudentModel {
  const _$StudentModelImpl(
      {required this.id,
      required this.name,
      required this.phone,
      required this.photo,
      required this.status});

  factory _$StudentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String photo;
  @override
  final int status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StudentModel(id: $id, name: $name, phone: $phone, photo: $photo, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StudentModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('photo', photo))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone, photo, status);

  /// Create a copy of StudentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentModelImplCopyWith<_$StudentModelImpl> get copyWith =>
      __$$StudentModelImplCopyWithImpl<_$StudentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentModelImplToJson(
      this,
    );
  }
}

abstract class _StudentModel implements StudentModel {
  const factory _StudentModel(
      {required final int id,
      required final String name,
      required final String phone,
      required final String photo,
      required final int status}) = _$StudentModelImpl;

  factory _StudentModel.fromJson(Map<String, dynamic> json) =
      _$StudentModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get photo;
  @override
  int get status;

  /// Create a copy of StudentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentModelImplCopyWith<_$StudentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
