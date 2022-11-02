// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmployeeRequest _$$_EmployeeRequestFromJson(Map<String, dynamic> json) =>
    _$_EmployeeRequest(
      id: json['id'] as int,
      type: json['type'] as String,
      data: json['data'] as String,
      responseTime: json['responseTime'] == null
          ? null
          : DateTime.parse(json['responseTime'] as String),
      responseData: json['responseData'] as String?,
      responseStatus:
          $enumDecode(_$HrResponseStatusEnumMap, json['responseStatus']),
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$_EmployeeRequestToJson(_$_EmployeeRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'data': instance.data,
      'responseTime': instance.responseTime?.toIso8601String(),
      'responseData': instance.responseData,
      'responseStatus': _$HrResponseStatusEnumMap[instance.responseStatus]!,
      'created': instance.created.toIso8601String(),
    };

const _$HrResponseStatusEnumMap = {
  HrResponseStatus.WAITING: 'WAITING',
  HrResponseStatus.ACCEPTED: 'ACCEPTED',
  HrResponseStatus.REJECTED: 'REJECTED',
};
