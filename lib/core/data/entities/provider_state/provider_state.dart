import 'package:flutter/foundation.dart';

import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';

typedef ProviderStateSetter<State> = void Function(
  ProviderStateSetterParameter<State>,
);
typedef ProviderStateSetterParameter<State> = ProviderState Function(
  State state,
);

@immutable
class ProviderState<Model> {
  final String? errorMessage;
  final ApiState apiState;

  const ProviderState({
    this.errorMessage,
    this.apiState = ApiState.IDLE,
  });

  ProviderState copyWith({
    String? errorMessage,
    ApiState? apiState,
  }) {
    return ProviderState(
      errorMessage: errorMessage ?? this.errorMessage,
      apiState: apiState ?? this.apiState,
    );
  }

  @override
  String toString() =>
      'ProviderState(errorMessage: $errorMessage, apiState: $apiState)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProviderState<Model> &&
        other.errorMessage == errorMessage &&
        other.apiState == apiState;
  }

  @override
  int get hashCode => errorMessage.hashCode ^ apiState.hashCode;
}
