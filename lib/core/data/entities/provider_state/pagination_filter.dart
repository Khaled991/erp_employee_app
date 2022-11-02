import 'package:erp_employee_app/core/utils/date_time_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_filter.freezed.dart';

@freezed
class PaginationFilter with _$PaginationFilter {
  const PaginationFilter._();

  factory PaginationFilter({
    required int page,
    required String month,
  }) = _PaginationFilter;

  factory PaginationFilter.initial() =>
      PaginationFilter(page: 0, month: DateTimeUtils.toYYYYMM(DateTime.now()));

  Map<String, dynamic> toJson() => {
        "page": page,
        "month": month,
      };
}
