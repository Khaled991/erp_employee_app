import 'package:erp_employee_app/core/data/entities/provider_state/provider_state.dart';
import 'package:erp_employee_app/core/domain/providers/provider_with_socket.dart';
import 'package:erp_employee_app/features/employee_request/data/models/employee_request.dart';
import 'package:erp_employee_app/features/employee_request/domain/repository/employee_request_repository.dart';

class EmployeeRequestProvider extends ProviderWithSocket<EmployeeRequest> {
  ProviderState _sendRequestState = const ProviderState();
  final EmployeeRequestRepository _employeeRequestRepository;

  EmployeeRequestProvider({
    required EmployeeRequestRepository employeeRequestRepository,
    required super.socket,
  })  : _employeeRequestRepository = employeeRequestRepository,
        super(
          repository: employeeRequestRepository,
          fromJson: EmployeeRequest.fromJson,
        );

  Future<void> sendRequest({required String type, required String data}) async {
    await makeApiRequest(
      setState: setSendRequestState,
      callback: () async {
        await _employeeRequestRepository.sendRequest(type: type, data: data);
      },
    );
  }

  void onReceivedResponseFromHr() {
    _employeeRequestRepository.onReceivedResponseFromHr(shiftToListState);
  }

  ProviderState get sendRequestState => _sendRequestState;

  void setSendRequestState(
      ProviderStateSetterParameter<ProviderState> setState) {
    ProviderState sendRequestState = setState(this.sendRequestState);
    _sendRequestState = sendRequestState;
    notifyListeners();
  }
}
