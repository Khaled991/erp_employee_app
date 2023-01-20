import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:erp_employee_app/features/attendance/domain/providers/attendance_provider.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/attendance/circular_animated_button.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/attendance/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RenderTimerLeaveButton extends StatelessWidget {
  final Widget? child;
  final double radius;
  final AttendanceProvider attendanceProvider;

  const RenderTimerLeaveButton({
    Key? key,
    this.child,
    required this.attendanceProvider,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularAnimatedButton(
        radius: radius,
        onPressed: () => attendanceProvider.canLeave(context),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TimerWidget(
                attendTime: context
                    .read<AttendanceProvider>()
                    .listState
                    .data[0]
                    .attendTime,
              ),
              const Icon(
                Icons.logout_rounded,
                color: ThemeColors.white,
                size: 40.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
