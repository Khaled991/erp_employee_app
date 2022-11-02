import 'package:erp_employee_app/features/employee_request/data/enums/hr_response_status.dart';
import 'package:erp_employee_app/features/employee_request/data/models/employee_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('fromJson', () {
    test('should return EmployeeRequest object when fromJson called', () async {
      // arrange
      final Map<String, dynamic> jsonMap = {
        "id": 1,
        "type": "VACATION",
        "data": "I'm sick",
        "responseTime": "2022-06-30T11:18:23.000Z",
        "responseData": "No",
        "responseStatus": "REJECTED",
        "created": "2021-06-30T11:18:23.000Z"
      };
      // act
      final result = EmployeeRequest.fromJson(jsonMap);
      // assert
      expect(
        result,
        EmployeeRequest(
          id: jsonMap["id"],
          type: jsonMap["type"],
          data: jsonMap["data"],
          responseTime: DateTime.parse(jsonMap["responseTime"]),
          responseData: jsonMap["responseData"],
          responseStatus: HrResponseStatus.REJECTED,
          created: DateTime.parse(jsonMap["created"]),
        ),
      );
    });
  });
}
