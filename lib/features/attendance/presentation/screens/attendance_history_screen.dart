import 'package:erp_employee_app/core/config/routes.dart';
import 'package:erp_employee_app/core/config/theme/paddings.dart';
import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:erp_employee_app/core/presentation/components/icon_with_badge.dart';
import 'package:erp_employee_app/core/widgets/custom_app_bar.dart';
import 'package:erp_employee_app/features/attendance/data/models/attendance.dart';
import 'package:erp_employee_app/features/attendance/domain/providers/attendance_provider.dart';
import 'package:erp_employee_app/features/attendance/presentation/widgets/history/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      await attendanceProvider.findAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final attendanceProvider = context.watch<AttendanceProvider>();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'سجل الحضور',
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, Routes.historyFilter);
            },
            icon: const IconWithBadge(
              icon: Icons.filter_alt_rounded,
              iconColor: ThemeColors.primary,
              showBadge: true,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Paddings.screen),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: Paddings.screen,
          ),
          itemCount: attendanceProvider.listState.data.length,
          itemBuilder: (BuildContext context, int index) {
            final Attendance attendance =
                attendanceProvider.listState.data[index];
            return Padding(
              padding: const EdgeInsets.all(Paddings.small),
              child: HistoryTile(
                titleDate:
                    DateFormat("yyyy-MM-dd").format(attendance.attendTime),
                attendance: attendance,
              ),
            );
          },
        ),
      ),
    );
  }
}
