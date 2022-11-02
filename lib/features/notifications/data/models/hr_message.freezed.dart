// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hr_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HrMessage _$HrMessageFromJson(Map<String, dynamic> json) {
  return _HrMessage.fromJson(json);
}

/// @nodoc
mixin _$HrMessage {
  int get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime get messageDateTime => throw _privateConstructorUsedError;
  bool get seen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HrMessageCopyWith<HrMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HrMessageCopyWith<$Res> {
  factory $HrMessageCopyWith(HrMessage value, $Res Function(HrMessage) then) =
      _$HrMessageCopyWithImpl<$Res>;
  $Res call({int id, String message, DateTime messageDateTime, bool seen});
}

/// @nodoc
class _$HrMessageCopyWithImpl<$Res> implements $HrMessageCopyWith<$Res> {
  _$HrMessageCopyWithImpl(this._value, this._then);

  final HrMessage _value;
  // ignore: unused_field
  final $Res Function(HrMessage) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? messageDateTime = freezed,
    Object? seen = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messageDateTime: messageDateTime == freezed
          ? _value.messageDateTime
          : messageDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      seen: seen == freezed
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_HrMessageCopyWith<$Res> implements $HrMessageCopyWith<$Res> {
  factory _$$_HrMessageCopyWith(
          _$_HrMessage value, $Res Function(_$_HrMessage) then) =
      __$$_HrMessageCopyWithImpl<$Res>;
  @override
  $Res call({int id, String message, DateTime messageDateTime, bool seen});
}

/// @nodoc
class __$$_HrMessageCopyWithImpl<$Res> extends _$HrMessageCopyWithImpl<$Res>
    implements _$$_HrMessageCopyWith<$Res> {
  __$$_HrMessageCopyWithImpl(
      _$_HrMessage _value, $Res Function(_$_HrMessage) _then)
      : super(_value, (v) => _then(v as _$_HrMessage));

  @override
  _$_HrMessage get _value => super._value as _$_HrMessage;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? messageDateTime = freezed,
    Object? seen = freezed,
  }) {
    return _then(_$_HrMessage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messageDateTime: messageDateTime == freezed
          ? _value.messageDateTime
          : messageDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      seen: seen == freezed
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HrMessage implements _HrMessage {
  _$_HrMessage(
      {required this.id,
      required this.message,
      required this.messageDateTime,
      required this.seen});

  factory _$_HrMessage.fromJson(Map<String, dynamic> json) =>
      _$$_HrMessageFromJson(json);

  @override
  final int id;
  @override
  final String message;
  @override
  final DateTime messageDateTime;
  @override
  final bool seen;

  @override
  String toString() {
    return 'HrMessage(id: $id, message: $message, messageDateTime: $messageDateTime, seen: $seen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HrMessage &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.messageDateTime, messageDateTime) &&
            const DeepCollectionEquality().equals(other.seen, seen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(messageDateTime),
      const DeepCollectionEquality().hash(seen));

  @JsonKey(ignore: true)
  @override
  _$$_HrMessageCopyWith<_$_HrMessage> get copyWith =>
      __$$_HrMessageCopyWithImpl<_$_HrMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HrMessageToJson(this);
  }
}

abstract class _HrMessage implements HrMessage {
  factory _HrMessage(
      {required final int id,
      required final String message,
      required final DateTime messageDateTime,
      required final bool seen}) = _$_HrMessage;

  factory _HrMessage.fromJson(Map<String, dynamic> json) =
      _$_HrMessage.fromJson;

  @override
  int get id;
  @override
  String get message;
  @override
  DateTime get messageDateTime;
  @override
  bool get seen;
  @override
  @JsonKey(ignore: true)
  _$$_HrMessageCopyWith<_$_HrMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
