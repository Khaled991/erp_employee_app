// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hr_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HrMessage _$$_HrMessageFromJson(Map<String, dynamic> json) => _$_HrMessage(
      id: json['id'] as int,
      message: json['message'] as String,
      messageDateTime: DateTime.parse(json['messageDateTime'] as String),
      seen: json['seen'] as bool,
    );

Map<String, dynamic> _$$_HrMessageToJson(_$_HrMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'messageDateTime': instance.messageDateTime.toIso8601String(),
      'seen': instance.seen,
    };
