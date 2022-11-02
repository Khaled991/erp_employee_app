import 'package:erp_employee_app/core/data/entities/request_params/request_params.dart';

class PostRequestParams extends RequestParams {
  final Map<String, dynamic>? data;

  PostRequestParams({
    required super.path,
    this.data,
  });
}
