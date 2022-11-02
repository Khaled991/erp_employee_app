import 'package:erp_employee_app/core/data/entities/int_limits/int_limits.dart';
import 'package:flutter/material.dart';

import 'package:erp_employee_app/core/constants/months.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/history/tab_bar/tab_bar.dart';

class TabBarMonths extends StatelessWidget {
  final TickerProvider vsync;

  final IntLimits monthLimit;

  final void Function(List<String> tabs, int index) onTap;

  const TabBarMonths({
    Key? key,
    required this.vsync,
    required this.monthLimit,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarC(
      vsync: vsync,
      tabsTitles: months
          .getRange(monthLimit.start - 1, monthLimit.end)
          .toList()
          .reversed
          .toList(),
      onTap: onTap,
    );
  }
}
