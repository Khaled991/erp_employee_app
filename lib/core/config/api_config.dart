import 'package:dio/dio.dart';
import 'package:erp_employee_app/core/data/paths/common_paths.dart';

const token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InVzZXJuYW1lMiIsInN1YiI6MiwiaWF0IjoxNjU2ODI1OTI3fQ.y8hXpVXM5oCqFjuqbiXQz2AE91Oi4xWtVWPzkUcsieI";

final dioOptions = BaseOptions(baseUrl: CommonPaths.baseUrl, headers: {
  "Content-Type": "application/json",
  "Accept": "application/json",
  "Authorization": "Bearer $token",
});
