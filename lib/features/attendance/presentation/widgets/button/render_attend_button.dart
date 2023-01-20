import 'package:erp_employee_app/features/attendance/domain/providers/attendance_provider.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/attendance/circular_animated_button.dart';
import 'package:flutter/material.dart';

class RenderAttendButton extends StatelessWidget {
  final Widget? child;
  final double radius;
  final AttendanceProvider attendanceProvider;

  const RenderAttendButton({
    Key? key,
    this.child,
    required this.radius,
    required this.attendanceProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularAnimatedButton(
        radius: radius,
        onPressed: () => attendanceProvider.canAttend(context),
        child: const Text(
          "تسجيل\nالحضور",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 45.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
