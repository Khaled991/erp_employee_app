import 'package:erp_employee_app/core/data/api/api_request.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/pagination_filter.dart';
import 'package:erp_employee_app/core/data/entities/request_params/paginated_request_params.dart';
import 'package:erp_employee_app/core/data/models/paginated_response/paginated_response.dart';
import 'package:erp_employee_app/core/data/paths/common_paths.dart';
import 'package:erp_employee_app/core/domain/repositories/repository.dart';

class RepositoryWithPaginationList<Model> extends Repository {
  const RepositoryWithPaginationList({
    required super.api,
  });

  Future<PaginatedResponse<Model>> findAll(
    PaginationFilter paginationFields,
    FromJson<Model> fromJson,
  ) async {
    return await api.getPaginated<Model>(
      PaginatedRequestParams(
        path: CommonPaths.findAll,
        paginationFilter: paginationFields,
      ),
      fromJson,
    );
  }
}
