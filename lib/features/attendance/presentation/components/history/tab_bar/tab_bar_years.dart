import 'package:flutter/material.dart';

import 'package:erp_employee_app/core/data/entities/int_limits/int_limits.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/history/tab_bar/tab_bar.dart';

class TabBarYears extends StatelessWidget {
  final TickerProvider vsync;
  final IntLimits yearLimit;

  final void Function(List<String> tabsTitles, int index) onTap;

  const TabBarYears({
    Key? key,
    required this.vsync,
    required this.yearLimit,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarC(
      vsync: vsync,
      tabsTitles: List<String>.generate(
        yearLimit.end - yearLimit.start + 1,
        (int index) => (yearLimit.end - index).toString(),
      ).toList(),
      onTap: onTap,
    );
  }
}
