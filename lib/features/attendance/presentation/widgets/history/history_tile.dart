import 'package:flutter/material.dart';

import 'package:erp_employee_app/core/config/theme/border_radius.dart';
import 'package:erp_employee_app/core/config/theme/colors.dart';
import 'package:erp_employee_app/core/presentation/components/gap/gap.dart';
import 'package:erp_employee_app/features/attendance/data/models/attendance.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/history/day_and_date_component.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/history/time_badge.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/history/time_title_and_exact_time.dart';

class HistoryTile extends StatelessWidget {
  final TimeBadgeType? timeBadgeType;
  final Attendance attendance;

  const HistoryTile({
    Key? key,
    this.timeBadgeType,
    required this.attendance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(BorderRadiuses.small),
        ),
        color: white,
        border: Border.all(
          color: ColorPalette.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          textDirection: TextDirection.ltr,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DayAndDate(
                  dayNumber: attendance.attendTime.day,
                  weekDay: attendance.attendTime.weekday,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TimeTitleAndExactTime(
                        timeTitle: TimeTitle.attendance,
                        dateTime: attendance.attendTime,
                      ),
                      Container(
                        width: 1,
                        height: double.infinity,
                        color: ColorPalette.grey.withOpacity(0.25),
                      ),
                      TimeTitleAndExactTime(
                        timeTitle: TimeTitle.leaving,
                        dateTime: attendance.leaveTime,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (timeBadgeType != null)
                  TimeBadge(timeBadgeType: timeBadgeType!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
