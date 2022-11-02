import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/constants/months.dart';
import 'package:erp_employee_app/core/data/entities/duration_limits/duration_limits.dart';
import 'package:erp_employee_app/core/presentation/components/gap/gap.dart';
import 'package:erp_employee_app/features/attendance/domain/providers/attendance_provider.dart';
import 'package:erp_employee_app/features/attendance/domain/utils/attendance_utils.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/history/tab_bar/tab_bar_months.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/history/tab_bar/tab_bar_years.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/history/time_badge.dart';
import 'package:erp_employee_app/features/attendance/presentation/widgets/history/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen<T> extends StatefulWidget {
  const HistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryScreen<T>> createState() => _HistoryScreenState<T>();
}

class _HistoryScreenState<T> extends State<HistoryScreen<T>>
    with TickerProviderStateMixin {
  int? activeYear;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final attendanceProvider = context.read<AttendanceProvider>();
      await attendanceProvider.findDurationLimits();
      print(attendanceProvider.durationLimitsState.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final attendanceProvider = context.watch<AttendanceProvider>();
    final DurationLimits? durationLimits =
        attendanceProvider.durationLimitsState.data;

    return Scaffold(
      appBar: AppBar(
        title: const Text("سجل الحضور"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Paddings.screen),
        child: durationLimits != null
            ? Builder(builder: (context) {
                activeYear ??= durationLimits.start.year;
                return Gap(
                  children: [
                    TabBarYears(
                      vsync: this,
                      yearLimit: AttendanceUtils.getYearsLimits(durationLimits),
                      onTap: (List<String> years, int index) {
                        // setState(() => activeYear = int.parse(years[index]));
                        activeYear = int.parse(years[index]);
                        print(int.parse(years[index]));
                      },
                    ),
                    TabBarMonths(
                      vsync: this,
                      monthLimit: AttendanceUtils.getMonthLimitsOfYear(
                        activeYear!,
                        durationLimits,
                      ),
                      // endMonth: 5,
                      // startMonth: 9,
                      onTap: (List<String> tabs, int index) {
                        print(months.indexOf(tabs[index]) + 1);
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: Paddings.screen),
                        itemCount: attendanceProvider.listState.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: HistoryTile(
                              timeBadgeType: TimeBadgeType.overtime,
                              attendance:
                                  attendanceProvider.listState.data[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              })
            : null,
      ),
    );
  }
}
