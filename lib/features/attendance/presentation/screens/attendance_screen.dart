import 'package:erp_employee_app/core/config/routes.dart';
import 'package:erp_employee_app/features/attendance/domain/providers/attendance_provider.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/attendance/circular_animated_button.dart';
import 'package:erp_employee_app/features/attendance/presentation/components/attendance/try_again_button.dart';
import 'package:erp_employee_app/features/attendance/presentation/widgets/attendance/leave_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80.0,
        leading: MaterialButton(
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.of(context)
                .push(Routes.attendanceHistory(attendanceProvider));
          },
          child: const Icon(
            Icons.history,
            size: 30.0,
          ),
        ),
      ),
      body: Builder(builder: (context) {
        final hasAttendances = attendanceProvider.listState.data.isNotEmpty;
        final hasLeft =
            hasAttendances && attendanceProvider.listState.data[0].hasLeft;

        return ApiRenderer(
          apiState: attendanceProvider.getLastAttendanceState.apiState,
          idleWidget: _renderAttendButton(radius),
          loadedWidget: !hasAttendances || (hasAttendances && hasLeft)
              ? _renderAttendButton(radius)
              : _renderTimerLeaveButton(radius),
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

  Widget _renderAttendButton(double radius) {
    return Center(
      child: CircularAnimatedButton(
        radius: radius,
        onPressed: attendanceProvider.attend,
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

  Widget _renderTimerLeaveButton(double radius) {
    return Center(
      child: ChangeNotifierProvider<AttendanceProvider>.value(
        value: context.read<AttendanceProvider>(),
        child: LeaveButton(radius: radius),
      ),
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
