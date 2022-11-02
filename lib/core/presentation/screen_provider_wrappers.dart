import 'package:erp_employee_app/features/attendance/domain/providers/attendance_provider.dart';
import 'package:erp_employee_app/features/attendance/presentation/screens/attendance_history_screen.dart';
import 'package:erp_employee_app/features/attendance/presentation/screens/attendance_screen.dart';
import 'package:erp_employee_app/features/employee_request/domain/provider/employee_request_provider.dart';
import 'package:erp_employee_app/features/employee_request/presentation/screen/employee_request_screen.dart';
import 'package:erp_employee_app/features/notifications/domain/providers/hr_message_provider.dart';
import 'package:erp_employee_app/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:erp_employee_app/injection_container.dart';
import 'package:provider/provider.dart';

class ScreenProviderWrappers {
  static ChangeNotifierProvider attendance =
      ChangeNotifierProvider<AttendanceProvider>.value(
    value: serviceLocator<AttendanceProvider>(),
    builder: (context, child) => const AttendanceScreen(),
  );

  static ChangeNotifierProvider attendancesHistory(
          AttendanceProvider attendanceProviderValue) =>
      ChangeNotifierProvider<AttendanceProvider>.value(
        value: attendanceProviderValue,
        builder: (context, child) => const HistoryScreen(),
      );

  static ChangeNotifierProvider employeeRequest =
      ChangeNotifierProvider<EmployeeRequestProvider>(
    create: (context) => serviceLocator<EmployeeRequestProvider>(),
    builder: (context, child) => const EmployeeRequestScreen(),
  );

  static ChangeNotifierProvider notifications =
      ChangeNotifierProvider<HrMessagesProvider>(
    create: (context) => serviceLocator<HrMessagesProvider>(),
    builder: (context, child) => const NotificationsScreen(),
  );
}
