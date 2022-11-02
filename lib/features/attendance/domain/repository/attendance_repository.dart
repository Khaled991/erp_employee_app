import 'package:dio/dio.dart';
import 'package:erp_employee_app/core/data/api/api.dart';
import 'package:erp_employee_app/core/data/entities/request_params/post_request_params.dart';
import 'package:erp_employee_app/core/data/entities/request_params/get_request_params.dart';
import 'package:erp_employee_app/core/domain/repositories/repository_with_pagination_list.dart';
import 'package:erp_employee_app/features/attendance/data/models/attendance.dart';
import 'package:erp_employee_app/features/attendance/data/paths/attendance_api_paths.dart';

class AttendanceRepository extends RepositoryWithPaginationList<Attendance> {
  AttendanceRepository({
    required Api<Attendance> api,
  }) : super(api: api);

  Future<Attendance?> findLast() async {
    try {
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

  Future<Attendance> attend() {
    return api.postJson<Attendance>(
      params: PostRequestParams(
        path: AttendanceApiPaths.attend,
      ),
      fromJson: Attendance.fromJson,
    );
  }

  Future<Attendance> leave() {
    return api.postJson<Attendance>(
      params: PostRequestParams(
        path: AttendanceApiPaths.leave,
      ),
      fromJson: Attendance.fromJson,
    );
  }
}
