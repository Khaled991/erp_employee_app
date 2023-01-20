import 'package:erp_employee_app/features/attendance/domain/providers/attendance_provider.dart';
import 'package:erp_employee_app/features/attendance/presentation/screens/attendance_history_screen.dart';
import 'package:erp_employee_app/features/attendance/presentation/screens/attendance_screen.dart';
import 'package:erp_employee_app/features/employee_request/data/enums/employee_request_type.dart';
import 'package:erp_employee_app/features/employee_request/domain/provider/employee_request_provider.dart';
import 'package:erp_employee_app/features/employee_request/presentation/screen/employee_request_screen.dart';
import 'package:erp_employee_app/features/notifications/domain/providers/hr_message_provider.dart';
import 'package:erp_employee_app/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:erp_employee_app/injection_container.dart';
import 'package:provider/provider.dart';

class ScreenProviderWrappers {
  ScreenProviderWrappers._();

  static ChangeNotifierProvider attendance =
      ChangeNotifierProvider<AttendanceProvider>.value(
    value: serviceLocator<AttendanceProvider>(),
    child: const AttendanceScreen(),
  );

  static ChangeNotifierProvider attendancesHistory(
          AttendanceProvider attendanceProviderValue) =>
      ChangeNotifierProvider<AttendanceProvider>.value(
        value: attendanceProviderValue,
        child: const HistoryScreen(),
      );

  static ChangeNotifierProvider employeeRequest(
          {EmployeeRequestType? requestType}) =>
      ChangeNotifierProvider<EmployeeRequestProvider>(
        create: (context) => serviceLocator<EmployeeRequestProvider>(),
        child: EmployeeRequestScreen(requestType: requestType),
      );

  static ChangeNotifierProvider notifications =
      ChangeNotifierProvider<HrMessagesProvider>(
    create: (context) => serviceLocator<HrMessagesProvider>(),
    child: const NotificationsScreen(),
  );
}
