import 'package:erp_employee_app/core/data/api/api_request.dart';
import 'package:erp_employee_app/core/data/entities/duration_limits/duration_limits.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/data_state.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/paginated_state.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/pagination_filter.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/provider_state.dart';
import 'package:erp_employee_app/core/data/models/paginated_response/paginated_response.dart';
import 'package:erp_employee_app/core/domain/providers/abs_provider.dart';
import 'package:erp_employee_app/core/domain/repositories/repository_with_pagination_list.dart';

class ProviderWithListPaginated<Model> extends AbsProvider {
  PaginatedState<Model> _listState =
      PaginatedState(filter: PaginationFilter.initial());
  DataState<DurationLimits> _durationLimitsState =
      const DataState<DurationLimits>();

  final RepositoryWithPaginationList<Model> _repository;
  final FromJson<Model> fromJson;

  ProviderWithListPaginated({
    required RepositoryWithPaginationList<Model> repository,
    required this.fromJson,
  }) : _repository = repository;

  Future<void> findDurationLimits() async {
    return makeApiRequest(
      setState: setDurationLimitsState,
      callback: () async {
        DurationLimits durationLimits = await _repository.findDurationLimits();

        setDurationLimitsState((state) => state.copyWith(data: durationLimits));
      },
    );
  }

  Future<void> findAll() {
    return makeApiRequest(
      setState: setListState,
      callback: () async {
        final page = _listState.filter.page + 1;
        final filter = _listState.filter.copyWith(page: page);

        final PaginatedResponse<Model> paginatedResponse =
            await _repository.findAll(filter, fromJson);
        addAllToListState(paginatedResponse, filter);
      },
    );
  }

  Future<void> refreshFindAll() {
    return makeApiRequest(
      setState: setListState,
      callback: () async {
        PaginationFilter paginationFilter =
            PaginationFilter(page: 1, month: _listState.filter.month);
        final PaginatedResponse<Model> paginatedResponse =
            await _repository.findAll(paginationFilter, fromJson);

        setListState(
          (state) => listState.copyWith(
            data: paginatedResponse.data,
            filter: paginationFilter,
            hasMore: paginatedResponse.hasMore,
          ),
        );
      },
    );
  }

  void shiftToListState(Model listItem) {
    setListState(
      (state) => listState.copyWith(data: [listItem, ...listState.data]),
    );
  }

  void addAllToListState(
      PaginatedResponse<Model> paginatedResponse, PaginationFilter filter) {
    setListState(
      (state) => listState.copyWith(
        data: [...listState.data, ...paginatedResponse.data],
        filter: filter,
        hasMore: paginatedResponse.hasMore,
      ),
    );
  }

  PaginatedState<Model> get listState => _listState;

  void setListState(ProviderStateSetterParameter<DataState> setState) {
    ProviderState listState = setState(this.listState);
    _listState = listState as PaginatedState<Model>;
    notifyListeners();
  }

  DataState<DurationLimits> get durationLimitsState => _durationLimitsState;

  void setDurationLimitsState(
    ProviderStateSetterParameter<DataState> setState,
  ) {
    ProviderState durationLimitsState = setState(this.durationLimitsState);
    _durationLimitsState = durationLimitsState as DataState<DurationLimits>;
    notifyListeners();
  }
}
