import 'package:erp_employee_app/core/data/entities/provider_state/pagination_filter.dart';
import 'package:erp_employee_app/core/data/entities/request_params/get_request_params.dart';

class PaginatedRequestParams<Model> extends GetRequestParams {
  final PaginationFilter paginationFilter;
  PaginatedRequestParams({
    required super.path,
    required this.paginationFilter,
  });

  toQueryParameters() => paginationFilter.toJson();
}
