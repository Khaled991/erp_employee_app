import 'dart:math';

import 'package:dio/dio.dart';
import 'package:erp_employee_app/core/data/api/api.dart';
import 'package:erp_employee_app/core/data/api/api_request.dart';
import 'package:erp_employee_app/core/data/entities/duration_limits/duration_limits.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/pagination_filter.dart';
import 'package:erp_employee_app/core/data/entities/request_params/post_request_params.dart';
import 'package:erp_employee_app/core/data/entities/request_params/get_request_params.dart';
import 'package:erp_employee_app/core/data/models/paginated_response/paginated_response.dart';
import 'package:erp_employee_app/core/data/paths/common_paths.dart';
import 'package:erp_employee_app/core/domain/repositories/repository_with_pagination_list.dart';
import 'package:erp_employee_app/features/attendance/data/models/attendance.dart';
import 'package:erp_employee_app/features/attendance/data/paths/attendance_api_paths.dart';

//TODO: clean mocked responses

class AttendanceRepository extends RepositoryWithPaginationList<Attendance> {
  AttendanceRepository({
    required Api<Attendance> api,
  }) : super(api: api);

  Future<Attendance?> findLast() async {
    try {
      return Attendance(
        id: 1,
        attendTime: DateTime.now().subtract(const Duration(hours: 1)),
        leaveTime: DateTime.now().subtract(const Duration(minutes: 30)),
        isLate: Random().nextBool(),
        overtime: Random().nextBool(),
      );

      final lastAttendance = await api.getJson<Attendance>(
        params: GetRequestParams(path: AttendanceApiPaths.getLast),
        fromJson: Attendance.fromJson,
      );
      return lastAttendance;
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  Future<bool> canAttend() async {
    return true;
  }

  Future<Attendance> attend() async {
    return Attendance(
      id: 1,
      attendTime: DateTime.now(),
      leaveTime: null,
      isLate: Random().nextBool(),
      overtime: Random().nextBool(),
    );
    return await api.postJson<Attendance>(
      params: PostRequestParams(
        path: AttendanceApiPaths.attend,
      ),
      fromJson: Attendance.fromJson,
    );
  }

  Future<bool> canLeave() async {
    return false;
  }

  Future<Attendance> leave() async {
    return Attendance(
      id: 1,
      attendTime: DateTime.now().subtract(const Duration(hours: 1)),
      leaveTime: DateTime.now(),
      isLate: Random().nextBool(),
      overtime: Random().nextBool(),
    );
    return await api.postJson<Attendance>(
      params: PostRequestParams(
        path: AttendanceApiPaths.leave,
      ),
      fromJson: Attendance.fromJson,
    );
  }

  Future<PaginatedResponse<Attendance>> findAll(
    PaginationFilter paginationFields,
    FromJson<Attendance> fromJson,
  ) async {
    return PaginatedResponse(
      first: 1,
      last: 20,
      limit: 20,
      total: 50,
      data: List.generate(20, (index) {
        return Attendance(
          id: index + 1,
          attendTime: DateTime.now()
              .subtract(Duration(hours: 8, days: Random().nextInt(100))),
          leaveTime: DateTime.now(),
          isLate: Random().nextBool(),
          overtime: Random().nextBool(),
        );
      }),
    );
  }

  Future<DurationLimits> findDurationLimits() async {
    return DurationLimits(
      start: DateTime.now().subtract(const Duration(days: 500)),
      end: DateTime.now(),
    );
    return await api.getJson(
      params: GetRequestParams(path: CommonPaths.getDurationLimits),
      fromJson: DurationLimits.fromJson,
    );
  }
}
