// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attendance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return _Attendance.fromJson(json);
}

/// @nodoc
mixin _$Attendance {
  int get id => throw _privateConstructorUsedError;
  DateTime get attendTime => throw _privateConstructorUsedError;
  DateTime? get leaveTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceCopyWith<Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res>;
  $Res call({int id, DateTime attendTime, DateTime? leaveTime});
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res> implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

  final Attendance _value;
  // ignore: unused_field
  final $Res Function(Attendance) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? attendTime = freezed,
    Object? leaveTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attendTime: attendTime == freezed
          ? _value.attendTime
          : attendTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      leaveTime: leaveTime == freezed
          ? _value.leaveTime
          : leaveTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_AttendanceCopyWith<$Res>
    implements $AttendanceCopyWith<$Res> {
  factory _$$_AttendanceCopyWith(
          _$_Attendance value, $Res Function(_$_Attendance) then) =
      __$$_AttendanceCopyWithImpl<$Res>;
  @override
  $Res call({int id, DateTime attendTime, DateTime? leaveTime});
}

/// @nodoc
class __$$_AttendanceCopyWithImpl<$Res> extends _$AttendanceCopyWithImpl<$Res>
    implements _$$_AttendanceCopyWith<$Res> {
  __$$_AttendanceCopyWithImpl(
      _$_Attendance _value, $Res Function(_$_Attendance) _then)
      : super(_value, (v) => _then(v as _$_Attendance));

  @override
  _$_Attendance get _value => super._value as _$_Attendance;

  @override
  $Res call({
    Object? id = freezed,
    Object? attendTime = freezed,
    Object? leaveTime = freezed,
  }) {
    return _then(_$_Attendance(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attendTime: attendTime == freezed
          ? _value.attendTime
          : attendTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      leaveTime: leaveTime == freezed
          ? _value.leaveTime
          : leaveTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Attendance extends _Attendance {
  _$_Attendance(
      {required this.id, required this.attendTime, required this.leaveTime})
      : super._();

  factory _$_Attendance.fromJson(Map<String, dynamic> json) =>
      _$$_AttendanceFromJson(json);

  @override
  final int id;
  @override
  final DateTime attendTime;
  @override
  final DateTime? leaveTime;

  @override
  String toString() {
    return 'Attendance(id: $id, attendTime: $attendTime, leaveTime: $leaveTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Attendance &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.attendTime, attendTime) &&
            const DeepCollectionEquality().equals(other.leaveTime, leaveTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(attendTime),
      const DeepCollectionEquality().hash(leaveTime));

  @JsonKey(ignore: true)
  @override
  _$$_AttendanceCopyWith<_$_Attendance> get copyWith =>
      __$$_AttendanceCopyWithImpl<_$_Attendance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttendanceToJson(this);
  }
}

abstract class _Attendance extends Attendance {
  factory _Attendance(
      {required final int id,
      required final DateTime attendTime,
      required final DateTime? leaveTime}) = _$_Attendance;
  _Attendance._() : super._();

  factory _Attendance.fromJson(Map<String, dynamic> json) =
      _$_Attendance.fromJson;

  @override
  int get id;
  @override
  DateTime get attendTime;
  @override
  DateTime? get leaveTime;
  @override
  @JsonKey(ignore: true)
  _$$_AttendanceCopyWith<_$_Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}
