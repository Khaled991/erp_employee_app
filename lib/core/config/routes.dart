import 'package:erp_employee_app/core/presentation/screen_provider_wrappers.dart';
import 'package:erp_employee_app/core/presentation/screens/home_screen.dart';
import 'package:erp_employee_app/core/presentation/screens/splash_screen.dart';
import 'package:erp_employee_app/features/attendance/domain/providers/attendance_provider.dart';
import 'package:erp_employee_app/features/attendance/presentation/screens/history_filter_screen.dart';
import 'package:erp_employee_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:erp_employee_app/features/employee_request/data/enums/employee_request_type.dart';
import 'package:erp_employee_app/features/notifications/presentation/screens/notification_filters_screen.dart';
import 'package:erp_employee_app/features/privacy_and_security/privacy_and_security_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();
  static MaterialPageRoute _makeRoute(Widget screen) =>
      MaterialPageRoute(builder: (context) => screen);

  static MaterialPageRoute get splash => _makeRoute(const SplashScreen());
  static MaterialPageRoute get auth => _makeRoute(const AuthScreen());
  static MaterialPageRoute get home => _makeRoute(const HomeScreen());
  static MaterialPageRoute get historyFilter =>
      _makeRoute(const HistoryFilterScreen());
  static MaterialPageRoute get notificatioFilters =>
      _makeRoute(const NotificatioFiltersScreen());

  static MaterialPageRoute employeeRequest(
          {EmployeeRequestType? requestType}) =>
      _makeRoute(
          ScreenProviderWrappers.employeeRequest(requestType: requestType));

  static MaterialPageRoute get privacyAndSecurity =>
      _makeRoute(const PrivacyAndSecurityScreen());

  static MaterialPageRoute attendanceHistory(
      AttendanceProvider attendanceProviderValue) {
    return _makeRoute(
      ScreenProviderWrappers.attendancesHistory(attendanceProviderValue),
    );
  }

  // static MaterialPageRoute auth() => makeRoute(const AuthScreen());
}
