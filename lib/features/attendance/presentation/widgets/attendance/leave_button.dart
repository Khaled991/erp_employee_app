import 'dart:math';

import 'package:erp_employee_app/core/config/theme/colors.dart';
import 'package:erp_employee_app/features/attendance/domain/providers/attendance_provider.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/attendance/timer_widget.dart';
import 'package:erp_employee_app/features/attendance/presentation/widgets/attendance/painters/arc_painter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeaveButton extends StatelessWidget {
  const LeaveButton({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    final data = context.read<AttendanceProvider>().listState.data;

    return CustomPaint(
      painter: ArcPainter(
        percentage: 0.9,
        backgroundColor: lightGrey,
        fillColor: Theme.of(context).primaryColor,
        radius: radius / 2,
      ),
      child: GestureDetector(
        onTap: context.read<AttendanceProvider>().leave,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          width: radius - 40,
          height: radius - 40,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                TimerWidget(attendTime: data[0].attendTime),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi)
                    ..translate(0.0, 50.0), //Mirror Widget
                  child: const Icon(
                    Icons.exit_to_app,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
