import 'package:flutter/foundation.dart';

import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/provider_state.dart';

@immutable
class DataState<Model> extends ProviderState<Model> {
  final Model? data;

  const DataState({
    this.data,
    super.apiState = ApiState.IDLE,
    super.errorMessage,
  });

  @override
  DataState<Model> copyWith({
    Model? data,
    ApiState? apiState,
    String? errorMessage,
  }) {
    return DataState<Model>(
      data: data ?? this.data,
      apiState: apiState ?? this.apiState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataState<Model> && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}
