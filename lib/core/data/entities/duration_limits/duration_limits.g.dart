// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration_limits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DurationLimits _$$_DurationLimitsFromJson(Map<String, dynamic> json) =>
    _$_DurationLimits(
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$$_DurationLimitsToJson(_$_DurationLimits instance) =>
    <String, dynamic>{
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };
