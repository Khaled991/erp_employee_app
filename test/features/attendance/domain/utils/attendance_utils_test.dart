import 'dart:math';

import 'package:erp_employee_app/core/data/entities/duration_limits/duration_limits.dart';
import 'package:erp_employee_app/core/data/entities/int_limits/int_limits.dart';
import 'package:erp_employee_app/features/attendance/domain/utils/attendance_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DurationLimits generateDateLimits(int yearsToSubtractFromStart) =>
      DurationLimits(
        start: DateTime(2022 - yearsToSubtractFromStart, 3),
        end: DateTime(2022, 10),
      );
  group('getYearLimits', () {
    test(
        'should return IntLimits with correct limits in when DurationLimits passed as a parameter',
        () async {
      // arrange
      final yearsBeforeStart = 2 + Random().nextInt(5);
      final DurationLimits durationLimits =
          generateDateLimits(yearsBeforeStart);
      // act
      IntLimits dateLimits = AttendanceUtils.getYearsLimits(durationLimits);
      // assert
      final startDate =
          DateTime.now().subtract(Duration(days: yearsBeforeStart * 365));
      final endDate = DateTime.now();
      expect(dateLimits, IntLimits(start: startDate.year, end: endDate.year));
    });
  });

  group('getMonthLimitsOfYear', () {
    group('one year', () {
      test(
        "should return IntLimits(start: 3, end: 10) when  has the same year with start month 3 and end month 10",
        () async {
          // arrange
          DurationLimits durationLimits = generateDateLimits(0);
          // act
          IntLimits monthsLimitsOfYear =
              AttendanceUtils.getMonthLimitsOfYear(2022, durationLimits);
          // assert
          expect(monthsLimitsOfYear, IntLimits(start: 3, end: 10));
        },
      );
    });
    group('more than one year', () {
      test(
        "should return IntLimits(start: 1, end: 10) when year = last year and DateLimits has the same year with start month 3 and end month 10",
        () async {
          // arrange
          int yearsToSubtractFromStart = 2 + Random().nextInt(5);
          DurationLimits durationLimits =
              generateDateLimits(yearsToSubtractFromStart);
          // act
          IntLimits monthsLimitsOfYear =
              AttendanceUtils.getMonthLimitsOfYear(2022, durationLimits);
          // assert
          expect(monthsLimitsOfYear, IntLimits(start: 1, end: 10));
        },
      );
      test(
        "should return IntLimits(start: 1, end: 12) when year = year in the middle of the duration and DateLimits has the same year with start month 3 and end month 10",
        () async {
          // arrange
          int yearsToSubtractFromStart = 2 + Random().nextInt(5);
          DurationLimits durationLimits =
              generateDateLimits(yearsToSubtractFromStart);
          // act
          IntLimits monthsLimitsOfYear =
              AttendanceUtils.getMonthLimitsOfYear(2021, durationLimits);
          // assert
          expect(monthsLimitsOfYear, IntLimits(start: 1, end: 12));
        },
      );
      test(
        "should return IntLimits(start: 3, end: 12) when year = first year and DateLimits has the same year with start month 3 and end month 10",
        () async {
          // arrange
          int yearsToSubtractFromStart = 2 + Random().nextInt(5);
          DurationLimits durationLimits =
              generateDateLimits(yearsToSubtractFromStart);
          // act
          IntLimits monthsLimitsOfYear = AttendanceUtils.getMonthLimitsOfYear(
            2022 - yearsToSubtractFromStart,
            durationLimits,
          );
          // assert
          expect(monthsLimitsOfYear, IntLimits(start: 3, end: 12));
        },
      );
    });
  });
}


/// 1 year
/// more than 1 year