import 'package:erp_employee_app/core/data/entities/duration_limits/duration_limits.dart';
import 'package:erp_employee_app/core/data/entities/int_limits/int_limits.dart';

class AttendanceUtils {
  static IntLimits getYearsLimits(DurationLimits durationLimits) {
    return IntLimits(
        start: durationLimits.start.year, end: durationLimits.end.year);
  }

  static IntLimits getMonthLimitsOfYear(
    int year,
    DurationLimits durationLimits,
  ) {
    late int startMonth = _getStartMonth(year, durationLimits.start);
    late int endMonth = _getEndMonth(year, durationLimits.end);
    return IntLimits(start: startMonth, end: endMonth);
  }

  static int _getStartMonth(int year, DateTime dateLimitsStart) =>
      year == dateLimitsStart.year ? dateLimitsStart.month : 1;

  static int _getEndMonth(int year, DateTime dateLimitsEnd) =>
      year == dateLimitsEnd.year ? dateLimitsEnd.month : 12;
}

/// 04-2020 4-12
/// 2021    1-12
/// 10-2022 1-10
/// 
/// if year == dateLimit.year.start ->  month= dateLimit.months.start |  else month= 1
/// if year == dateLimit.year.end   month= dateLimit.months.end |  else month= 12