import 'package:erp_employee_app/core/data/entities/request_params/request_params.dart';

class GetRequestParams extends RequestParams {
  final Map<String, dynamic>? queryParams;

  GetRequestParams({
    required super.path,
    this.queryParams,
  });
}
