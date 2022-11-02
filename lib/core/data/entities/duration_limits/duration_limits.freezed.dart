// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'duration_limits.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DurationLimits _$DurationLimitsFromJson(Map<String, dynamic> json) {
  return _DurationLimits.fromJson(json);
}

/// @nodoc
mixin _$DurationLimits {
  DateTime get start => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DurationLimitsCopyWith<DurationLimits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationLimitsCopyWith<$Res> {
  factory $DurationLimitsCopyWith(
          DurationLimits value, $Res Function(DurationLimits) then) =
      _$DurationLimitsCopyWithImpl<$Res>;
  $Res call({DateTime start, DateTime end});
}

/// @nodoc
class _$DurationLimitsCopyWithImpl<$Res>
    implements $DurationLimitsCopyWith<$Res> {
  _$DurationLimitsCopyWithImpl(this._value, this._then);

  final DurationLimits _value;
  // ignore: unused_field
  final $Res Function(DurationLimits) _then;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_DurationLimitsCopyWith<$Res>
    implements $DurationLimitsCopyWith<$Res> {
  factory _$$_DurationLimitsCopyWith(
          _$_DurationLimits value, $Res Function(_$_DurationLimits) then) =
      __$$_DurationLimitsCopyWithImpl<$Res>;
  @override
  $Res call({DateTime start, DateTime end});
}

/// @nodoc
class __$$_DurationLimitsCopyWithImpl<$Res>
    extends _$DurationLimitsCopyWithImpl<$Res>
    implements _$$_DurationLimitsCopyWith<$Res> {
  __$$_DurationLimitsCopyWithImpl(
      _$_DurationLimits _value, $Res Function(_$_DurationLimits) _then)
      : super(_value, (v) => _then(v as _$_DurationLimits));

  @override
  _$_DurationLimits get _value => super._value as _$_DurationLimits;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$_DurationLimits(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DurationLimits implements _DurationLimits {
  _$_DurationLimits({required this.start, required this.end});

  factory _$_DurationLimits.fromJson(Map<String, dynamic> json) =>
      _$$_DurationLimitsFromJson(json);

  @override
  final DateTime start;
  @override
  final DateTime end;

  @override
  String toString() {
    return 'DurationLimits(start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DurationLimits &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end));

  @JsonKey(ignore: true)
  @override
  _$$_DurationLimitsCopyWith<_$_DurationLimits> get copyWith =>
      __$$_DurationLimitsCopyWithImpl<_$_DurationLimits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DurationLimitsToJson(this);
  }
}

abstract class _DurationLimits implements DurationLimits {
  factory _DurationLimits(
      {required final DateTime start,
      required final DateTime end}) = _$_DurationLimits;

  factory _DurationLimits.fromJson(Map<String, dynamic> json) =
      _$_DurationLimits.fromJson;

  @override
  DateTime get start;
  @override
  DateTime get end;
  @override
  @JsonKey(ignore: true)
  _$$_DurationLimitsCopyWith<_$_DurationLimits> get copyWith =>
      throw _privateConstructorUsedError;
}
