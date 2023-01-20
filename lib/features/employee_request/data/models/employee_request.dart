import 'package:erp_employee_app/features/employee_request/data/enums/hr_response_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_request.freezed.dart';
part 'employee_request.g.dart';

@freezed
class EmployeeRequest with _$EmployeeRequest {
  factory EmployeeRequest({
    required int id,
    required String type,
    required String data,
    DateTime? responseTime,
    String? responseData,
    required HrResponseStatus responseStatus,
    required DateTime created,
  }) = _EmployeeRequest;

  factory EmployeeRequest.fromJson(dynamic json) =>
      _$EmployeeRequestFromJson(json);
}
