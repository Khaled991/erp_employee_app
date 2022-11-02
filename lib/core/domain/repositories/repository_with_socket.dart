import 'package:erp_employee_app/core/domain/repositories/repository_with_pagination_list.dart';
import 'package:socket_io_client/socket_io_client.dart';

typedef AddToListState<Model> = void Function(Model item);

abstract class RepositoryWithSocket<Model>
    extends RepositoryWithPaginationList<Model> {
  final Socket socket;

  const RepositoryWithSocket({
    required super.api,
    required this.socket,
  });
}
