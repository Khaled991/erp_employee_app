// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pagination_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaginationFilter {
  int get page => throw _privateConstructorUsedError;
  String get month => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationFilterCopyWith<PaginationFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationFilterCopyWith<$Res> {
  factory $PaginationFilterCopyWith(
          PaginationFilter value, $Res Function(PaginationFilter) then) =
      _$PaginationFilterCopyWithImpl<$Res>;
  $Res call({int page, String month});
}

/// @nodoc
class _$PaginationFilterCopyWithImpl<$Res>
    implements $PaginationFilterCopyWith<$Res> {
  _$PaginationFilterCopyWithImpl(this._value, this._then);

  final PaginationFilter _value;
  // ignore: unused_field
  final $Res Function(PaginationFilter) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? month = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PaginationFilterCopyWith<$Res>
    implements $PaginationFilterCopyWith<$Res> {
  factory _$$_PaginationFilterCopyWith(
          _$_PaginationFilter value, $Res Function(_$_PaginationFilter) then) =
      __$$_PaginationFilterCopyWithImpl<$Res>;
  @override
  $Res call({int page, String month});
}

/// @nodoc
class __$$_PaginationFilterCopyWithImpl<$Res>
    extends _$PaginationFilterCopyWithImpl<$Res>
    implements _$$_PaginationFilterCopyWith<$Res> {
  __$$_PaginationFilterCopyWithImpl(
      _$_PaginationFilter _value, $Res Function(_$_PaginationFilter) _then)
      : super(_value, (v) => _then(v as _$_PaginationFilter));

  @override
  _$_PaginationFilter get _value => super._value as _$_PaginationFilter;

  @override
  $Res call({
    Object? page = freezed,
    Object? month = freezed,
  }) {
    return _then(_$_PaginationFilter(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PaginationFilter extends _PaginationFilter {
  _$_PaginationFilter({required this.page, required this.month}) : super._();

  @override
  final int page;
  @override
  final String month;

  @override
  String toString() {
    return 'PaginationFilter(page: $page, month: $month)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationFilter &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.month, month));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(month));

  @JsonKey(ignore: true)
  @override
  _$$_PaginationFilterCopyWith<_$_PaginationFilter> get copyWith =>
      __$$_PaginationFilterCopyWithImpl<_$_PaginationFilter>(this, _$identity);
}

abstract class _PaginationFilter extends PaginationFilter {
  factory _PaginationFilter(
      {required final int page,
      required final String month}) = _$_PaginationFilter;
  _PaginationFilter._() : super._();

  @override
  int get page;
  @override
  String get month;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationFilterCopyWith<_$_PaginationFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
