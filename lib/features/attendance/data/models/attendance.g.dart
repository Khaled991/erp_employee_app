// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Attendance _$$_AttendanceFromJson(Map<String, dynamic> json) =>
    _$_Attendance(
      id: json['id'] as int,
      attendTime: DateTime.parse(json['attendTime'] as String),
      leaveTime: json['leaveTime'] == null
          ? null
          : DateTime.parse(json['leaveTime'] as String),
      overtime: json['overtime'] as bool,
      isLate: json['isLate'] as bool,
    );

Map<String, dynamic> _$$_AttendanceToJson(_$_Attendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attendTime': instance.attendTime.toIso8601String(),
      'leaveTime': instance.leaveTime?.toIso8601String(),
      'overtime': instance.overtime,
      'isLate': instance.isLate,
    };
