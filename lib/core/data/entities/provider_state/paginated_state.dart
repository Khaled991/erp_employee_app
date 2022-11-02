import 'package:erp_employee_app/core/data/entities/provider_state/pagination_filter.dart';
import 'package:flutter/foundation.dart';

import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/data_state.dart';

@immutable
class PaginatedState<Model> extends DataState<List<Model>> {
  final PaginationFilter filter;
  final bool hasMore;

  const PaginatedState({
    this.hasMore = false,
    super.apiState,
    super.data = const [],
    super.errorMessage,
    required this.filter,
  });

  @override
  List<Model> get data => super.data!;

  @override
  PaginatedState<Model> copyWith({
    int? page,
    bool? hasMore,
    ApiState? apiState,
    List<Model>? data,
    String? errorMessage,
    PaginationFilter? filter,
  }) {
    return PaginatedState<Model>(
      hasMore: hasMore ?? this.hasMore,
      apiState: apiState ?? this.apiState,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      filter: filter ?? this.filter,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaginatedState<Model> &&
        other.filter == filter &&
        other.hasMore == hasMore;
  }

  @override
  int get hashCode => filter.hashCode ^ hasMore.hashCode;

  @override
  String toString() =>
      "PaginatedState(filter: $filter, hasMore: $hasMore, apiState: $apiState, data: $data, errorMessage: $errorMessage, )";
}
