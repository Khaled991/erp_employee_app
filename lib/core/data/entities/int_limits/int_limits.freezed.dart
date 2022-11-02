// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'int_limits.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IntLimits {
  int get start => throw _privateConstructorUsedError;
  int get end => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IntLimitsCopyWith<IntLimits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntLimitsCopyWith<$Res> {
  factory $IntLimitsCopyWith(IntLimits value, $Res Function(IntLimits) then) =
      _$IntLimitsCopyWithImpl<$Res>;
  $Res call({int start, int end});
}

/// @nodoc
class _$IntLimitsCopyWithImpl<$Res> implements $IntLimitsCopyWith<$Res> {
  _$IntLimitsCopyWithImpl(this._value, this._then);

  final IntLimits _value;
  // ignore: unused_field
  final $Res Function(IntLimits) _then;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_IntLimitsCopyWith<$Res> implements $IntLimitsCopyWith<$Res> {
  factory _$$_IntLimitsCopyWith(
          _$_IntLimits value, $Res Function(_$_IntLimits) then) =
      __$$_IntLimitsCopyWithImpl<$Res>;
  @override
  $Res call({int start, int end});
}

/// @nodoc
class __$$_IntLimitsCopyWithImpl<$Res> extends _$IntLimitsCopyWithImpl<$Res>
    implements _$$_IntLimitsCopyWith<$Res> {
  __$$_IntLimitsCopyWithImpl(
      _$_IntLimits _value, $Res Function(_$_IntLimits) _then)
      : super(_value, (v) => _then(v as _$_IntLimits));

  @override
  _$_IntLimits get _value => super._value as _$_IntLimits;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$_IntLimits(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_IntLimits implements _IntLimits {
  _$_IntLimits({required this.start, required this.end});

  @override
  final int start;
  @override
  final int end;

  @override
  String toString() {
    return 'IntLimits(start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IntLimits &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end));

  @JsonKey(ignore: true)
  @override
  _$$_IntLimitsCopyWith<_$_IntLimits> get copyWith =>
      __$$_IntLimitsCopyWithImpl<_$_IntLimits>(this, _$identity);
}

abstract class _IntLimits implements IntLimits {
  factory _IntLimits({required final int start, required final int end}) =
      _$_IntLimits;

  @override
  int get start;
  @override
  int get end;
  @override
  @JsonKey(ignore: true)
  _$$_IntLimitsCopyWith<_$_IntLimits> get copyWith =>
      throw _privateConstructorUsedError;
}
