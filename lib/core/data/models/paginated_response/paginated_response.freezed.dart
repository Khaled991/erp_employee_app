// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paginated_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaginatedResponse<Model> {
  int get first => throw _privateConstructorUsedError;
  int get last => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<Model> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginatedResponseCopyWith<Model, PaginatedResponse<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedResponseCopyWith<Model, $Res> {
  factory $PaginatedResponseCopyWith(PaginatedResponse<Model> value,
          $Res Function(PaginatedResponse<Model>) then) =
      _$PaginatedResponseCopyWithImpl<Model, $Res>;
  $Res call({int first, int last, int limit, int total, List<Model> data});
}

/// @nodoc
class _$PaginatedResponseCopyWithImpl<Model, $Res>
    implements $PaginatedResponseCopyWith<Model, $Res> {
  _$PaginatedResponseCopyWithImpl(this._value, this._then);

  final PaginatedResponse<Model> _value;
  // ignore: unused_field
  final $Res Function(PaginatedResponse<Model>) _then;

  @override
  $Res call({
    Object? first = freezed,
    Object? last = freezed,
    Object? limit = freezed,
    Object? total = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      last: last == freezed
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Model>,
    ));
  }
}

/// @nodoc
abstract class _$$_PaginatedResponseCopyWith<Model, $Res>
    implements $PaginatedResponseCopyWith<Model, $Res> {
  factory _$$_PaginatedResponseCopyWith(_$_PaginatedResponse<Model> value,
          $Res Function(_$_PaginatedResponse<Model>) then) =
      __$$_PaginatedResponseCopyWithImpl<Model, $Res>;
  @override
  $Res call({int first, int last, int limit, int total, List<Model> data});
}

/// @nodoc
class __$$_PaginatedResponseCopyWithImpl<Model, $Res>
    extends _$PaginatedResponseCopyWithImpl<Model, $Res>
    implements _$$_PaginatedResponseCopyWith<Model, $Res> {
  __$$_PaginatedResponseCopyWithImpl(_$_PaginatedResponse<Model> _value,
      $Res Function(_$_PaginatedResponse<Model>) _then)
      : super(_value, (v) => _then(v as _$_PaginatedResponse<Model>));

  @override
  _$_PaginatedResponse<Model> get _value =>
      super._value as _$_PaginatedResponse<Model>;

  @override
  $Res call({
    Object? first = freezed,
    Object? last = freezed,
    Object? limit = freezed,
    Object? total = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_PaginatedResponse<Model>(
      first: first == freezed
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as int,
      last: last == freezed
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Model>,
    ));
  }
}

/// @nodoc

class _$_PaginatedResponse<Model> extends _PaginatedResponse<Model> {
  _$_PaginatedResponse(
      {required this.first,
      required this.last,
      required this.limit,
      required this.total,
      required final List<Model> data})
      : _data = data,
        super._();

  @override
  final int first;
  @override
  final int last;
  @override
  final int limit;
  @override
  final int total;
  final List<Model> _data;
  @override
  List<Model> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PaginatedResponse<$Model>(first: $first, last: $last, limit: $limit, total: $total, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginatedResponse<Model> &&
            const DeepCollectionEquality().equals(other.first, first) &&
            const DeepCollectionEquality().equals(other.last, last) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(first),
      const DeepCollectionEquality().hash(last),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_PaginatedResponseCopyWith<Model, _$_PaginatedResponse<Model>>
      get copyWith => __$$_PaginatedResponseCopyWithImpl<Model,
          _$_PaginatedResponse<Model>>(this, _$identity);
}

abstract class _PaginatedResponse<Model> extends PaginatedResponse<Model> {
  factory _PaginatedResponse(
      {required final int first,
      required final int last,
      required final int limit,
      required final int total,
      required final List<Model> data}) = _$_PaginatedResponse<Model>;
  _PaginatedResponse._() : super._();

  @override
  int get first;
  @override
  int get last;
  @override
  int get limit;
  @override
  int get total;
  @override
  List<Model> get data;
  @override
  @JsonKey(ignore: true)
  _$$_PaginatedResponseCopyWith<Model, _$_PaginatedResponse<Model>>
      get copyWith => throw _privateConstructorUsedError;
}
