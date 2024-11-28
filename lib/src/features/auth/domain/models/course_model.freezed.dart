// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseModelModel _$CourseModelModelFromJson(Map<String, dynamic> json) {
  return _CourseModelModel.fromJson(json);
}

/// @nodoc
mixin _$CourseModelModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get room => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  TeacherModel get teacher => throw _privateConstructorUsedError;

  /// Serializes this CourseModelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseModelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseModelModelCopyWith<CourseModelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseModelModelCopyWith<$Res> {
  factory $CourseModelModelCopyWith(
          CourseModelModel value, $Res Function(CourseModelModel) then) =
      _$CourseModelModelCopyWithImpl<$Res, CourseModelModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String room,
      @JsonKey(name: 'user') TeacherModel teacher});

  $TeacherModelCopyWith<$Res> get teacher;
}

/// @nodoc
class _$CourseModelModelCopyWithImpl<$Res, $Val extends CourseModelModel>
    implements $CourseModelModelCopyWith<$Res> {
  _$CourseModelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseModelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? room = null,
    Object? teacher = null,
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
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as TeacherModel,
    ) as $Val);
  }

  /// Create a copy of CourseModelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeacherModelCopyWith<$Res> get teacher {
    return $TeacherModelCopyWith<$Res>(_value.teacher, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseModelModelImplCopyWith<$Res>
    implements $CourseModelModelCopyWith<$Res> {
  factory _$$CourseModelModelImplCopyWith(_$CourseModelModelImpl value,
          $Res Function(_$CourseModelModelImpl) then) =
      __$$CourseModelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String room,
      @JsonKey(name: 'user') TeacherModel teacher});

  @override
  $TeacherModelCopyWith<$Res> get teacher;
}

/// @nodoc
class __$$CourseModelModelImplCopyWithImpl<$Res>
    extends _$CourseModelModelCopyWithImpl<$Res, _$CourseModelModelImpl>
    implements _$$CourseModelModelImplCopyWith<$Res> {
  __$$CourseModelModelImplCopyWithImpl(_$CourseModelModelImpl _value,
      $Res Function(_$CourseModelModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseModelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? room = null,
    Object? teacher = null,
  }) {
    return _then(_$CourseModelModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as TeacherModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseModelModelImpl
    with DiagnosticableTreeMixin
    implements _CourseModelModel {
  const _$CourseModelModelImpl(
      {required this.id,
      required this.name,
      required this.room,
      @JsonKey(name: 'user') required this.teacher});

  factory _$CourseModelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseModelModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String room;
  @override
  @JsonKey(name: 'user')
  final TeacherModel teacher;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseModelModel(id: $id, name: $name, room: $room, teacher: $teacher)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CourseModelModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('room', room))
      ..add(DiagnosticsProperty('teacher', teacher));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseModelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.teacher, teacher) || other.teacher == teacher));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, room, teacher);

  /// Create a copy of CourseModelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseModelModelImplCopyWith<_$CourseModelModelImpl> get copyWith =>
      __$$CourseModelModelImplCopyWithImpl<_$CourseModelModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseModelModelImplToJson(
      this,
    );
  }
}

abstract class _CourseModelModel implements CourseModelModel {
  const factory _CourseModelModel(
          {required final int id,
          required final String name,
          required final String room,
          @JsonKey(name: 'user') required final TeacherModel teacher}) =
      _$CourseModelModelImpl;

  factory _CourseModelModel.fromJson(Map<String, dynamic> json) =
      _$CourseModelModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get room;
  @override
  @JsonKey(name: 'user')
  TeacherModel get teacher;

  /// Create a copy of CourseModelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseModelModelImplCopyWith<_$CourseModelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
