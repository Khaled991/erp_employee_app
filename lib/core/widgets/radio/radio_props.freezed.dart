// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'radio_props.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RadioProps<T> {
  String get title => throw _privateConstructorUsedError;
  T get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RadioPropsCopyWith<T, RadioProps<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadioPropsCopyWith<T, $Res> {
  factory $RadioPropsCopyWith(
          RadioProps<T> value, $Res Function(RadioProps<T>) then) =
      _$RadioPropsCopyWithImpl<T, $Res>;
  $Res call({String title, T value});
}

/// @nodoc
class _$RadioPropsCopyWithImpl<T, $Res>
    implements $RadioPropsCopyWith<T, $Res> {
  _$RadioPropsCopyWithImpl(this._value, this._then);

  final RadioProps<T> _value;
  // ignore: unused_field
  final $Res Function(RadioProps<T>) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class _$$_RadioPropsCopyWith<T, $Res>
    implements $RadioPropsCopyWith<T, $Res> {
  factory _$$_RadioPropsCopyWith(
          _$_RadioProps<T> value, $Res Function(_$_RadioProps<T>) then) =
      __$$_RadioPropsCopyWithImpl<T, $Res>;
  @override
  $Res call({String title, T value});
}

/// @nodoc
class __$$_RadioPropsCopyWithImpl<T, $Res>
    extends _$RadioPropsCopyWithImpl<T, $Res>
    implements _$$_RadioPropsCopyWith<T, $Res> {
  __$$_RadioPropsCopyWithImpl(
      _$_RadioProps<T> _value, $Res Function(_$_RadioProps<T>) _then)
      : super(_value, (v) => _then(v as _$_RadioProps<T>));

  @override
  _$_RadioProps<T> get _value => super._value as _$_RadioProps<T>;

  @override
  $Res call({
    Object? title = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_RadioProps<T>(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_RadioProps<T> implements _RadioProps<T> {
  _$_RadioProps({required this.title, required this.value});

  @override
  final String title;
  @override
  final T value;

  @override
  String toString() {
    return 'RadioProps<$T>(title: $title, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RadioProps<T> &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_RadioPropsCopyWith<T, _$_RadioProps<T>> get copyWith =>
      __$$_RadioPropsCopyWithImpl<T, _$_RadioProps<T>>(this, _$identity);
}

abstract class _RadioProps<T> implements RadioProps<T> {
  factory _RadioProps({required final String title, required final T value}) =
      _$_RadioProps<T>;

  @override
  String get title;
  @override
  T get value;
  @override
  @JsonKey(ignore: true)
  _$$_RadioPropsCopyWith<T, _$_RadioProps<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
