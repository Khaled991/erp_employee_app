import 'package:erp_employee_app/core/presentation/screen_provider_wrappers.dart';
import 'package:erp_employee_app/core/presentation/screens/infinite_scroll_screen/home_screen.dart';
import 'package:erp_employee_app/core/presentation/screens/splash_screen.dart';
import 'package:erp_employee_app/features/attendance/domain/providers/attendance_provider.dart';
import 'package:erp_employee_app/features/auth/presentation/auth_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static MaterialPageRoute _makeRoute(Widget screen) =>
      MaterialPageRoute(builder: (context) => screen);

  static MaterialPageRoute get splash => _makeRoute(const SplashScreen());
  static MaterialPageRoute get auth => _makeRoute(const AuthScreen());
  static MaterialPageRoute get home => _makeRoute(const HomeScreen());

  static MaterialPageRoute attendanceHistory(
      AttendanceProvider attendanceProviderValue) {
    return _makeRoute(
      ScreenProviderWrappers.attendancesHistory(attendanceProviderValue),
    );
  }

  // static MaterialPageRoute auth() => makeRoute(const AuthScreen());
}
