// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'employee_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmployeeRequest _$EmployeeRequestFromJson(Map<String, dynamic> json) {
  return _EmployeeRequest.fromJson(json);
}

/// @nodoc
mixin _$EmployeeRequest {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  DateTime? get responseTime => throw _privateConstructorUsedError;
  String? get responseData => throw _privateConstructorUsedError;
  HrResponseStatus get responseStatus => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeRequestCopyWith<EmployeeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeRequestCopyWith<$Res> {
  factory $EmployeeRequestCopyWith(
          EmployeeRequest value, $Res Function(EmployeeRequest) then) =
      _$EmployeeRequestCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String type,
      String data,
      DateTime? responseTime,
      String? responseData,
      HrResponseStatus responseStatus,
      DateTime created});
}

/// @nodoc
class _$EmployeeRequestCopyWithImpl<$Res>
    implements $EmployeeRequestCopyWith<$Res> {
  _$EmployeeRequestCopyWithImpl(this._value, this._then);

  final EmployeeRequest _value;
  // ignore: unused_field
  final $Res Function(EmployeeRequest) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? data = freezed,
    Object? responseTime = freezed,
    Object? responseData = freezed,
    Object? responseStatus = freezed,
    Object? created = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: responseTime == freezed
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      responseData: responseData == freezed
          ? _value.responseData
          : responseData // ignore: cast_nullable_to_non_nullable
              as String?,
      responseStatus: responseStatus == freezed
          ? _value.responseStatus
          : responseStatus // ignore: cast_nullable_to_non_nullable
              as HrResponseStatus,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_EmployeeRequestCopyWith<$Res>
    implements $EmployeeRequestCopyWith<$Res> {
  factory _$$_EmployeeRequestCopyWith(
          _$_EmployeeRequest value, $Res Function(_$_EmployeeRequest) then) =
      __$$_EmployeeRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String type,
      String data,
      DateTime? responseTime,
      String? responseData,
      HrResponseStatus responseStatus,
      DateTime created});
}

/// @nodoc
class __$$_EmployeeRequestCopyWithImpl<$Res>
    extends _$EmployeeRequestCopyWithImpl<$Res>
    implements _$$_EmployeeRequestCopyWith<$Res> {
  __$$_EmployeeRequestCopyWithImpl(
      _$_EmployeeRequest _value, $Res Function(_$_EmployeeRequest) _then)
      : super(_value, (v) => _then(v as _$_EmployeeRequest));

  @override
  _$_EmployeeRequest get _value => super._value as _$_EmployeeRequest;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? data = freezed,
    Object? responseTime = freezed,
    Object? responseData = freezed,
    Object? responseStatus = freezed,
    Object? created = freezed,
  }) {
    return _then(_$_EmployeeRequest(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      responseTime: responseTime == freezed
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      responseData: responseData == freezed
          ? _value.responseData
          : responseData // ignore: cast_nullable_to_non_nullable
              as String?,
      responseStatus: responseStatus == freezed
          ? _value.responseStatus
          : responseStatus // ignore: cast_nullable_to_non_nullable
              as HrResponseStatus,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmployeeRequest implements _EmployeeRequest {
  _$_EmployeeRequest(
      {required this.id,
      required this.type,
      required this.data,
      this.responseTime,
      this.responseData,
      required this.responseStatus,
      required this.created});

  factory _$_EmployeeRequest.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeRequestFromJson(json);

  @override
  final int id;
  @override
  final String type;
  @override
  final String data;
  @override
  final DateTime? responseTime;
  @override
  final String? responseData;
  @override
  final HrResponseStatus responseStatus;
  @override
  final DateTime created;

  @override
  String toString() {
    return 'EmployeeRequest(id: $id, type: $type, data: $data, responseTime: $responseTime, responseData: $responseData, responseStatus: $responseStatus, created: $created)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmployeeRequest &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality()
                .equals(other.responseTime, responseTime) &&
            const DeepCollectionEquality()
                .equals(other.responseData, responseData) &&
            const DeepCollectionEquality()
                .equals(other.responseStatus, responseStatus) &&
            const DeepCollectionEquality().equals(other.created, created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(responseTime),
      const DeepCollectionEquality().hash(responseData),
      const DeepCollectionEquality().hash(responseStatus),
      const DeepCollectionEquality().hash(created));

  @JsonKey(ignore: true)
  @override
  _$$_EmployeeRequestCopyWith<_$_EmployeeRequest> get copyWith =>
      __$$_EmployeeRequestCopyWithImpl<_$_EmployeeRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeRequestToJson(this);
  }
}

abstract class _EmployeeRequest implements EmployeeRequest {
  factory _EmployeeRequest(
      {required final int id,
      required final String type,
      required final String data,
      final DateTime? responseTime,
      final String? responseData,
      required final HrResponseStatus responseStatus,
      required final DateTime created}) = _$_EmployeeRequest;

  factory _EmployeeRequest.fromJson(Map<String, dynamic> json) =
      _$_EmployeeRequest.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override
  String get data;
  @override
  DateTime? get responseTime;
  @override
  String? get responseData;
  @override
  HrResponseStatus get responseStatus;
  @override
  DateTime get created;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeRequestCopyWith<_$_EmployeeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
