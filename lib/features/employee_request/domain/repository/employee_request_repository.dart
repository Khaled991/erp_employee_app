import 'package:erp_employee_app/core/data/api/api.dart';
import 'package:erp_employee_app/core/data/entities/request_params/post_request_params.dart';
import 'package:erp_employee_app/core/domain/repositories/repository_with_socket.dart';
import 'package:erp_employee_app/features/employee_request/data/models/employee_request.dart';
import 'package:erp_employee_app/features/employee_request/data/paths/employee_request_api_paths.dart';
import 'package:erp_employee_app/features/employee_request/data/paths/employee_request_socket_events.dart';

class EmployeeRequestRepository extends RepositoryWithSocket<EmployeeRequest> {
  EmployeeRequestRepository({
    required Api<EmployeeRequest> api,
    required super.socket,
  }) : super(api: api);

  Future<void> sendRequest({required String type, required String data}) {
    return api.postRaw(
      params: PostRequestParams(
        path: EmployeeRequestApiPaths.sendRequest,
        data: <String, dynamic>{"type": type, "data": data},
      ),
    );
  }

  void onReceivedResponseFromHr(
    AddToListState<EmployeeRequest> addToListState,
  ) {
    socket.on(
      EmployeeRequestSocketEvents.receiveHrResponse,
      (data) {
        EmployeeRequest employeeRequest = EmployeeRequest.fromJson(data);
        addToListState(employeeRequest);
      },
    );
  }
}
