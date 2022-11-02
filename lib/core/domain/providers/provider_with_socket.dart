import 'package:erp_employee_app/core/domain/providers/provider_with_list_paginated.dart';
import 'package:socket_io_client/socket_io_client.dart';

abstract class ProviderWithSocket<Model>
    extends ProviderWithListPaginated<Model> {
  final Socket socket;

  ProviderWithSocket({
    required super.repository,
    required super.fromJson,
    required this.socket,
  });

  @override
  void shiftToListState(Model listItem) {
    setListState(
      (state) => listState.copyWith(
        data: [listItem, ...listState.data],
      ),
    );
  }
}
