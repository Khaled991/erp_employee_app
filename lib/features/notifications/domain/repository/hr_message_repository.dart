import 'package:erp_employee_app/core/data/api/api.dart';
import 'package:erp_employee_app/core/domain/repositories/repository_with_socket.dart';
import 'package:erp_employee_app/features/notifications/data/models/hr_message.dart';
import 'package:erp_employee_app/features/notifications/data/paths/hr_message_socket_events.dart';

class HrMessageRepository extends RepositoryWithSocket<HrMessage> {
  HrMessageRepository({
    required Api<HrMessage> api,
    required super.socket,
  }) : super(api: api);

  void onMessageReceived(AddToListState<HrMessage> addToListState) {
    socket.on(
      HrMessageSocketEvents.receiveHrMessage,
      (data) {
        HrMessage hrMessage = HrMessage.fromJson(data);
        addToListState(hrMessage);
      },
    );
  }
}
