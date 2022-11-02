import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:erp_employee_app/core/config/api_config.dart';
import 'package:erp_employee_app/core/data/api/api.dart';
import 'package:erp_employee_app/core/data/api/api_request.dart';
import 'package:erp_employee_app/core/data/paths/common_paths.dart';
import 'package:erp_employee_app/core/platform/network_info.dart';
import 'package:erp_employee_app/core/platform/storage/storage.dart';
import 'package:erp_employee_app/features/attendance/data/models/attendance.dart';
import 'package:erp_employee_app/features/attendance/data/paths/attendance_api_paths.dart';
import 'package:erp_employee_app/features/attendance/domain/providers/attendance_provider.dart';
import 'package:erp_employee_app/features/attendance/domain/repository/attendance_repository.dart';
import 'package:erp_employee_app/features/auth/data/models/user.dart';
import 'package:erp_employee_app/features/auth/data/paths/auth_api_paths.dart';
import 'package:erp_employee_app/features/auth/data/platform/auth_storage.dart';
import 'package:erp_employee_app/features/auth/domain/providers/auth_provider.dart';
import 'package:erp_employee_app/features/auth/domain/repository/auth_repository.dart';
import 'package:erp_employee_app/features/employee_request/data/models/employee_request.dart';
import 'package:erp_employee_app/features/employee_request/data/paths/employee_request_api_paths.dart';
import 'package:erp_employee_app/features/employee_request/domain/provider/employee_request_provider.dart';
import 'package:erp_employee_app/features/employee_request/domain/repository/employee_request_repository.dart';
import 'package:erp_employee_app/features/notifications/data/models/hr_message.dart';
import 'package:erp_employee_app/features/notifications/data/paths/hr_message_api_paths.dart';
import 'package:erp_employee_app/features/notifications/domain/providers/hr_message_provider.dart';
import 'package:erp_employee_app/features/notifications/domain/repository/hr_message_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';

final serviceLocator = GetIt.instance;

Future<void> injectionInit() async {
  //! Features - Auth
  // provider
  serviceLocator.registerFactory<AuthProvider>(() => AuthProvider(
        authRepository: serviceLocator(),
        authStorage: serviceLocator(),
      ));
  serviceLocator.registerLazySingleton(() => AuthStorage(serviceLocator()));
  serviceLocator.registerLazySingleton(() => StringStorage(serviceLocator()));

  // repository
  serviceLocator
      .registerLazySingleton(() => AuthRepository(api: serviceLocator()));
  serviceLocator.registerLazySingleton<Api<User>>(
    () => Api<User>(
      apiRequest: serviceLocator(),
      dio: serviceLocator(),
      baseRequestPath: AuthApiPaths.basePath,
    ),
  );

  //! Features - Attendance
  // provider
  serviceLocator.registerFactory<AttendanceProvider>(
      () => AttendanceProvider(attendanceRepository: serviceLocator()));

  // repository
  serviceLocator
      .registerLazySingleton(() => AttendanceRepository(api: serviceLocator()));
  serviceLocator.registerLazySingleton<Api<Attendance>>(
    () => Api<Attendance>(
      apiRequest: serviceLocator(),
      dio: serviceLocator(),
      baseRequestPath: AttendanceApiPaths.basePath,
    ),
  );

  //! Features - HrMessage
  // provider
  serviceLocator.registerFactory<HrMessagesProvider>(() => HrMessagesProvider(
        hrMessRepository: serviceLocator(),
        socket: serviceLocator(),
      ));

  // repository
  serviceLocator.registerLazySingleton(() => HrMessageRepository(
        api: serviceLocator(),
        socket: serviceLocator(),
      ));
  serviceLocator.registerLazySingleton<Api<HrMessage>>(
    () => Api<HrMessage>(
      apiRequest: serviceLocator(),
      dio: serviceLocator(),
      baseRequestPath: HrMessageApiPaths.basePath,
    ),
  );

  //! Features - EmployeeRequest
  // provider
  serviceLocator
      .registerFactory<EmployeeRequestProvider>(() => EmployeeRequestProvider(
            employeeRequestRepository: serviceLocator(),
            socket: serviceLocator(),
          ));

  // repository
  serviceLocator.registerLazySingleton(() => EmployeeRequestRepository(
        api: serviceLocator(),
        socket: serviceLocator(),
      ));
  serviceLocator.registerLazySingleton<Api<EmployeeRequest>>(
    () => Api<EmployeeRequest>(
      apiRequest: serviceLocator(),
      dio: serviceLocator(),
      baseRequestPath: EmployeeRequestApiPaths.basePath,
    ),
  );

  //! Core
  // ApiRequest
  serviceLocator
      .registerLazySingleton(() => ApiRequest(networkInfo: serviceLocator()));
  serviceLocator.registerLazySingleton(() => NetworkInfo(serviceLocator()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  // Dio
  serviceLocator.registerLazySingleton(() => Dio(serviceLocator()));
  serviceLocator.registerLazySingleton(() => dioOptions);

  // Socket io
  serviceLocator.registerLazySingleton<Socket>(() => io(CommonPaths.baseUrl));

  // Connectivity
  serviceLocator.registerLazySingleton(() => Connectivity());
}
