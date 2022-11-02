import 'package:dio/dio.dart';
import 'package:erp_employee_app/core/data/entities/request_params/request_params.dart';
import 'package:erp_employee_app/core/errors/exceptions.dart';
import 'package:erp_employee_app/core/platform/network_info.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> json);

class ApiRequest {
  final NetworkInfo networkInfo;

  const ApiRequest({required this.networkInfo});

  Future<Model> raw<Model>({
    required RequestParams params,
    required Future<Response> Function() dioRequest,
  }) {
    return request(
      callback: () async {
        final response = await dioRequest();
        return response.data;
      },
    );
  }

  Future<Model> json<Model>({
    required RequestParams params,
    required Future<Response> dioRequest,
    required FromJson<Model> fromJson,
  }) async {
    return request(
      callback: () async {
        final response = await dioRequest;
        return fromJson(response.data);
      },
    );
  }

  Future<Model> request<Model>({
    required Future<Model> Function() callback,
  }) async {
    await checkConnectivity();
    try {
      final response = await callback();
      print(response);

      return response;
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode == 401) {
        throw UnauthorizedException();
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  /// Throws a [NoInternetException] if there is no internet connection.
  Future<void> checkConnectivity() async {
    if (await networkInfo.isConnected == false) {
      throw NoInternetException();
    }
  }
}
