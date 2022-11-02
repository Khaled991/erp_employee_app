import 'package:dio/dio.dart';

import 'package:erp_employee_app/core/data/api/api_request.dart';
import 'package:erp_employee_app/core/data/entities/request_params/get_request_params.dart';
import 'package:erp_employee_app/core/data/entities/request_params/paginated_request_params.dart';
import 'package:erp_employee_app/core/data/entities/request_params/post_request_params.dart';
import 'package:erp_employee_app/core/data/models/paginated_response/paginated_response.dart';

class Api<T> {
  final ApiRequest apiRequest;
  final Dio dio;
  final String baseRequestPath;

  const Api({
    required this.apiRequest,
    required this.dio,
    required this.baseRequestPath,
  });

  Future<PaginatedResponse<Model>> getPaginated<Model>(
    PaginatedRequestParams params,
    FromJson<Model> fromJson,
  ) async {
    final paginatedResponse = await apiRequest.raw(
      params: params,
      dioRequest: () async => dio.get(buildPath(params.path),
          queryParameters: params.toQueryParameters()),
    );

    return PaginatedResponse.fromJson(paginatedResponse, fromJson);
  }

  Future<Model> getRaw<Model>({
    required GetRequestParams params,
  }) async {
    return apiRequest.raw<Model>(
      params: params,
      dioRequest: () async {
        return await dio.get(
          buildPath(params.path),
          queryParameters: params.queryParams,
        );
      },
    );
  }

  Future<Model> getJson<Model>({
    required GetRequestParams params,
    required FromJson<Model> fromJson,
  }) async {
    return apiRequest.json<Model>(
      params: params,
      fromJson: fromJson,
      dioRequest:
          dio.get(buildPath(params.path), queryParameters: params.queryParams),
    );
  }

  Future<Model> postRaw<Model>({
    required PostRequestParams params,
  }) async {
    return apiRequest.raw<Model>(
      params: params,
      dioRequest: () async =>
          dio.post(buildPath(params.path), data: params.data),
    );
  }

  Future<Model> postJson<Model>({
    required PostRequestParams params,
    required FromJson<Model> fromJson,
  }) async {
    return apiRequest.json<Model>(
      params: params,
      fromJson: fromJson,
      dioRequest: dio.post(buildPath(params.path), data: params.data),
    );
  }

  String buildPath(String path) {
    String builtPath = '$baseRequestPath$path';
    print(builtPath);
    return builtPath;
  }
}
