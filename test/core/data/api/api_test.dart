import 'package:dio/dio.dart';
import 'package:erp_employee_app/core/data/api/api.dart';
import 'package:erp_employee_app/core/data/api/api_request.dart';
import 'package:erp_employee_app/core/data/entities/request_params/get_request_params.dart';
import 'package:erp_employee_app/core/errors/exceptions.dart';
import 'package:erp_employee_app/core/platform/network_info.dart';
import 'package:erp_employee_app/features/attendance/data/models/attendance.dart';
import 'package:erp_employee_app/features/attendance/data/paths/attendance_api_paths.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_test.mocks.dart';

@GenerateMocks([Dio, NetworkInfo])
void main() {
  late MockDio mockDio;
  late MockNetworkInfo mockNetworkInfo;

  late ApiRequest apiRequest;
  late Api api;

  setUp(() {
    mockDio = MockDio();
    mockNetworkInfo = MockNetworkInfo();
    apiRequest = ApiRequest(networkInfo: mockNetworkInfo);

    api = Api<Attendance>(
      apiRequest: apiRequest,
      dio: mockDio,
      baseRequestPath: AttendanceApiPaths.basePath,
    );
  });

  test(
    "should throw NoInternetException when internet is not connected",
    () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenThrow(NoInternetException());
      // when(mockDio.get(any)).thenThrow(NoInternetException());
      // print(await api.getRaw(params: GetRequestParams(path: "/")));
      // act and assert
      expect(
        () async => await api.getRaw(params: GetRequestParams(path: "/")),
        throwsA(const TypeMatcher<NoInternetException>()),
      );
      verify(mockNetworkInfo.isConnected);
      verifyNever(mockDio.get(any));
    },
  );

  test(
    "should throw UnauthorizedException when statusCode == 401",
    () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockDio.get(any, queryParameters: anyNamed("queryParameters")))
          .thenThrow(
        DioError(
          requestOptions: RequestOptions(path: '/'),
          response: Response(
            requestOptions: RequestOptions(path: '/'),
            statusCode: 401,
          ),
        ),
      );
      // act and assert
      expect(
        () async => await api.getRaw(params: GetRequestParams(path: "/")),
        throwsA(const TypeMatcher<UnauthorizedException>()),
      );
    },
  );
}
