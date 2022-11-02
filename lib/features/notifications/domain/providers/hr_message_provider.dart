import 'package:erp_employee_app/core/domain/providers/provider_with_socket.dart';
import 'package:erp_employee_app/features/notifications/data/models/hr_message.dart';
import 'package:erp_employee_app/features/notifications/domain/repository/hr_message_repository.dart';

class HrMessagesProvider extends ProviderWithSocket<HrMessage> {
  final HrMessageRepository _hrMessRepository;

  HrMessagesProvider({
    required HrMessageRepository hrMessRepository,
    required super.socket,
  })  : _hrMessRepository = hrMessRepository,
        super(repository: hrMessRepository, fromJson: HrMessage.fromJson);

  void onMessageReceived() {
    _hrMessRepository.onMessageReceived(shiftToListState);
  }
}
