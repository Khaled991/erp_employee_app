import 'package:erp_employee_app/core/config/routes.dart';
import 'package:erp_employee_app/core/config/theme/theme_colors.dart';
import 'package:erp_employee_app/features/attendance/presentation/widgets/button/render_attend_button.dart';
import 'package:erp_employee_app/features/attendance/presentation/widgets/button/render_timer_leave_button.dart';
import 'package:erp_employee_app/core/widgets/custom_app_bar.dart';
import 'package:erp_employee_app/features/attendance/domain/providers/attendance_provider.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/attendance/try_again_button.dart';
import 'package:provider/provider.dart';
import 'package:erp_employee_app/core/presentation/components/api_renderer/api_renderer.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late final attendanceProvider = context.watch<AttendanceProvider>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      attendanceProvider
          .getLast()
          .then((value) => print(attendanceProvider.listState.data));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double radius = size.width * 0.6;

    return Scaffold(
      appBar: CustomAppBar(title: 'تسجيل الحضور', actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(Routes.attendanceHistory(attendanceProvider));
          },
          icon: const Icon(
            Icons.history_rounded,
            size: 30.0,
            color: ThemeColors.primary,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context, Routes.privacyAndSecurity);
          },
          icon: const Icon(
            Icons.error_rounded,
            size: 30.0,
            color: ThemeColors.primary,
          ),
        ),
      ]),
      body: Builder(builder: (context) {
        final hasAttendances = attendanceProvider.listState.data.isNotEmpty;
        final hasLeft =
            hasAttendances && attendanceProvider.listState.data[0].hasLeft;

        return ApiRenderer(
          apiState: attendanceProvider.getLastAttendanceState.apiState,
          idleWidget: RenderAttendButton(
              radius: radius, attendanceProvider: attendanceProvider),
          loadedWidget: !hasAttendances || (hasAttendances && hasLeft)
              ? RenderAttendButton(
                  radius: radius, attendanceProvider: attendanceProvider)
              : RenderTimerLeaveButton(
                  attendanceProvider: attendanceProvider, radius: radius),
          errorMessage: attendanceProvider.errorMessage,
          errorWidget: _renderErrorWidget(radius: radius),

          /////

          // Text(
          //   attendanceProvider.getLastAttendanceState.errorMessage ??
          //       attendanceProvider.listState.errorMessage ??
          //       attendanceProvider.attendState.errorMessage ??
          //       attendanceProvider.leaveState.errorMessage ??
          //       "ErrorMessages.SOMETHING_WENT_WRONG_TRY_AGAIN",
          // ),
        );
      }),
    );
  }

  Widget _renderErrorWidget({
    required double radius,
  }) {
    return Center(
      child: TryAgainButton(
        radius: radius,
        onPressed: attendanceProvider.getLast,
      ),
    );
  }
}
