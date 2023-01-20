import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:erp_employee_app/core/presentation/components/gap/gap.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/history/time_badge.dart';
import 'package:erp_employee_app/features/attendance/presentation/widgets/history/history_tile_side_bar.dart';
import 'package:erp_employee_app/features/attendance/presentation/widgets/history/history_tile_title.dart';
import 'package:flutter/material.dart';
import 'package:erp_employee_app/core/config/theme/border_radius.dart';
import 'package:erp_employee_app/features/attendance/data/models/attendance.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/history/time_title_and_exact_time_and_badge.dart';

class HistoryTile extends StatelessWidget {
  final String titleDate;
  final Attendance attendance;
  final Color titleAndSideBarsColor;

  const HistoryTile({
    Key? key,
    required this.attendance,
    required this.titleDate,
    this.titleAndSideBarsColor = ThemeColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(BorderRadiuses.small),
        ),
        color: ThemeColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            spreadRadius: 4,
            blurRadius: 6,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HistoryTileSideBar(color: titleAndSideBarsColor),
            Column(
              children: [
                HistoryTileTitle(
                  title: titleDate,
                  color: titleAndSideBarsColor,
                ),
                Gap(
                  isRow: true,
                  space: Paddings.extraLarge,
                  children: [
                    TimeTitleAndExactTimeAndBadge(
                      timeTitle: TimeTitle.attendance,
                      dateTime: attendance.attendTime,
                    ),
                    TimeTitleAndExactTimeAndBadge(
                      timeTitle: TimeTitle.leaving,
                      dateTime: attendance.leaveTime,
                    ),
                  ],
                ),
                Gap(
                  isRow: true,
                  space: Paddings.extraLarge,
                  children: [
                    if (attendance.isLate)
                      const TimeBadge(timeBadgeType: TimeBadgeType.earlier),
                    if (attendance.overtime)
                      const TimeBadge(timeBadgeType: TimeBadgeType.overtime),
                  ],
                )
              ],
            ),
            HistoryTileSideBar(color: titleAndSideBarsColor)
          ],
        ),
      ),
    );
  }
}
