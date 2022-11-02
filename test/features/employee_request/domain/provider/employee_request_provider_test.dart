import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:erp_employee_app/core/data/api/api.dart';
import 'package:erp_employee_app/core/data/api/api_request.dart';
import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';
import 'package:erp_employee_app/core/data/models/paginated_response/paginated_response.dart';
import 'package:erp_employee_app/core/errors/error_messages.dart';
import 'package:erp_employee_app/core/errors/exceptions.dart';
import 'package:erp_employee_app/core/platform/network_info.dart';
import 'package:erp_employee_app/features/employee_request/data/enums/employee_request_type.dart';
import 'package:erp_employee_app/features/employee_request/data/enums/hr_response_status.dart';
import 'package:erp_employee_app/features/employee_request/data/models/employee_request.dart';
import 'package:erp_employee_app/features/employee_request/data/paths/employee_request_api_paths.dart';
import 'package:erp_employee_app/features/employee_request/domain/provider/employee_request_provider.dart';
import 'package:erp_employee_app/features/employee_request/domain/repository/employee_request_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'employee_request_provider_test.mocks.dart';

@GenerateMocks([EmployeeRequestRepository, Socket])
void main() {
  late MockEmployeeRequestRepository mockEmployeeRequestRepository;
  late MockSocket mockSocket;

  late EmployeeRequestProvider employeeRequestProvider;
  group("Api Requests", () {
    setUp(() {
      mockEmployeeRequestRepository = MockEmployeeRequestRepository();
      mockSocket = MockSocket();
      employeeRequestProvider = EmployeeRequestProvider(
        employeeRequestRepository: mockEmployeeRequestRepository,
        socket: mockSocket,
      );
    });

    group('findAll', () {
      PaginatedResponse<EmployeeRequest> buildPaginatedEmployeeRequests({
        required int total,
        required int last,
      }) =>
          PaginatedResponse<EmployeeRequest>(
            first: 1,
            last: last,
            limit: 10,
            total: total,
            data: List<EmployeeRequest>.generate(
              10,
              (index) => EmployeeRequest(
                id: index,
                type: EmployeeRequestType.LEAVING.name,
                data: "I'm Sick",
                responseStatus: HrResponseStatus.WAITING,
                created: DateTime.now(),
              ),
            ),
          );

      test(
        "should return list of requests when total == last",
        () async {
          //arrange
          when(mockEmployeeRequestRepository.findAll(any, any)).thenAnswer(
            (_) async => PaginatedResponse.fromJson(
              {
                "first": 1,
                "last": 1,
                "limit": 10,
                "total": 1,
                "data": [
                  {
                    "id": 1,
                    "type": "VACATION",
                    "data": "I'm sick",
                    "responseTime": "2022-06-30T11:18:23.000Z",
                    "responseData": "No",
                    "responseStatus": "REJECTED",
                    "created": "2021-06-30T11:18:23.000Z"
                  }
                ]
              },
              EmployeeRequest.fromJson,
            ),
          );
          //act and assert
          expect(employeeRequestProvider.listState.apiState, ApiState.IDLE);
          expect(employeeRequestProvider.listState.data.length, equals(0));

          final findAll = employeeRequestProvider.findAll();
          expect(employeeRequestProvider.listState.apiState, ApiState.LOADING);
          await findAll;

          expect(employeeRequestProvider.listState.apiState, ApiState.LOADED);
          expect(employeeRequestProvider.listState.data.length, greaterThan(0));
          expect(employeeRequestProvider.listState.hasMore, false);
        },
      );

      test(
        "should return list of requests when total == last",
        () async {
          //arrange
          const int total = 10, last = 10;
          when(mockEmployeeRequestRepository.findAll(any, any)).thenAnswer(
              (_) async =>
                  buildPaginatedEmployeeRequests(total: total, last: last));
          //act and assert
          expect(employeeRequestProvider.listState.apiState, ApiState.IDLE);
          expect(employeeRequestProvider.listState.data.length, equals(0));

          final findAll = employeeRequestProvider.findAll();
          expect(employeeRequestProvider.listState.apiState, ApiState.LOADING);
          await findAll;

          expect(employeeRequestProvider.listState.apiState, ApiState.LOADED);
          expect(employeeRequestProvider.listState.data.length, greaterThan(0));
          expect(employeeRequestProvider.listState.hasMore, false);
        },
      );

      test(
        "should set paginated list to data and hasMore to false when total != last",
        () async {
          //arrange
          const int total = 20, last = 10;
          when(mockEmployeeRequestRepository.findAll(any, any)).thenAnswer(
              (_) async =>
                  buildPaginatedEmployeeRequests(total: total, last: last));
          //act and assert
          expect(employeeRequestProvider.listState.apiState, ApiState.IDLE);
          expect(employeeRequestProvider.listState.data.length, equals(0));

          final findAll = employeeRequestProvider.findAll();
          expect(employeeRequestProvider.listState.apiState, ApiState.LOADING);
          await findAll;

          expect(employeeRequestProvider.listState.apiState, ApiState.LOADED);
          expect(employeeRequestProvider.listState.data.length, greaterThan(0));
          expect(employeeRequestProvider.listState.hasMore, true);
        },
      );

      test(
        "should set apiState = ApiState.ERROR when throws NoInternetConnectionException",
        () async {
          //arrange
          when(mockEmployeeRequestRepository.findAll(any, any))
              .thenThrow(NoInternetException());
          //act and assert
          expect(employeeRequestProvider.listState.apiState, ApiState.IDLE);
          expect(employeeRequestProvider.listState.data.length, equals(0));

          final findAll = employeeRequestProvider.findAll();
          expect(employeeRequestProvider.listState.apiState, ApiState.LOADING);
          await findAll;

          expect(employeeRequestProvider.listState.apiState, ApiState.ERROR);
          expect(
            employeeRequestProvider.listState.errorMessage,
            ErrorMessages.NO_INTERNET_CONNECTION,
          );
        },
      );

      test(
        "should set apiState = ApiState.ERROR when throws DioError, and set errorMessage to Something went wrong",
        () async {
          //arrange
          const errorMessage = "Internal server error";
          when(mockEmployeeRequestRepository.findAll(any, any)).thenThrow(
            DioError(
              requestOptions: RequestOptions(path: "/"),
              response: Response(
                data: errorMessage,
                statusCode: 500,
                requestOptions: RequestOptions(path: "/"),
              ),
            ),
          );
          //act and assert
          expect(employeeRequestProvider.listState.apiState, ApiState.IDLE);
          expect(employeeRequestProvider.listState.data.length, equals(0));

          final findAll = employeeRequestProvider.findAll();
          expect(employeeRequestProvider.listState.apiState, ApiState.LOADING);
          await findAll;

          expect(employeeRequestProvider.listState.apiState, ApiState.ERROR);
          expect(
            employeeRequestProvider.listState.errorMessage,
            ErrorMessages.SOMETHING_WENT_WRONG_TRY_AGAIN,
          );
        },
      );
    });

    group("sendRequest", () {
      final String type = EmployeeRequestType.LEAVING.name;
      const String data = "I'm Sick";

      test(
        "should apiState = ApiState.LOADED when AttendanceRepository doesn't throw an exception",
        () async {
          //arrange
          when(mockEmployeeRequestRepository.sendRequest(
            type: anyNamed("type"),
            data: anyNamed("data"),
          )).thenAnswer((_) async {});
          //act and assert
          expect(
              employeeRequestProvider.sendRequestState.apiState, ApiState.IDLE);
          final sendRequest =
              employeeRequestProvider.sendRequest(type: type, data: data);
          expect(employeeRequestProvider.sendRequestState.apiState,
              ApiState.LOADING);
          await sendRequest;
          expect(employeeRequestProvider.sendRequestState.apiState,
              ApiState.LOADED);
        },
      );
      test(
        "should apiState = ApiState.Error when AttendanceRepository throws an exception",
        () async {
          //arrange

          when(mockEmployeeRequestRepository.sendRequest(
            type: anyNamed("type"),
            data: anyNamed("data"),
          )).thenThrow(Exception());
          //act and assert
          expect(
              employeeRequestProvider.sendRequestState.apiState, ApiState.IDLE);
          final sendRequest =
              employeeRequestProvider.sendRequest(type: type, data: data);
          expect(employeeRequestProvider.sendRequestState.apiState,
              ApiState.LOADING);
          await sendRequest;
          expect(employeeRequestProvider.sendRequestState.apiState,
              ApiState.ERROR);
        },
      );
    });
  });

  group('onReceivedResponseFromHr', () {
    setUp(() {
      mockEmployeeRequestRepository = MockEmployeeRequestRepository();
      mockSocket = MockSocket();

      employeeRequestProvider = EmployeeRequestProvider(
        employeeRequestRepository: EmployeeRequestRepository(
          socket: mockSocket,
          api: Api(
            apiRequest: ApiRequest(networkInfo: NetworkInfo(Connectivity())),
            dio: Dio(),
            baseRequestPath: EmployeeRequestApiPaths.basePath,
          ),
        ),
        socket: mockSocket,
      );
    });
    test(
      "should add message to message to data and hasMore to false when total == last",
      () async {
        //arrange
        when(mockSocket.on(any, any)).thenAnswer(
          (_) async => employeeRequestProvider.shiftToListState(
            EmployeeRequest(
              id: 1,
              type: "LEAVE",
              data: "I'm Sick",
              responseStatus: HrResponseStatus.ACCEPTED,
              created: DateTime.now(),
              responseTime: DateTime.now(),
              responseData: "OK",
            ),
          ),
        );
        // act
        final int requestsCount = employeeRequestProvider.listState.data.length;
        employeeRequestProvider.onReceivedResponseFromHr();

        // assert
        expect(
          employeeRequestProvider.listState.data.length,
          requestsCount + 1,
        );
        expect(
          employeeRequestProvider.listState.data.last.responseStatus,
          isNot(equals(HrResponseStatus.WAITING)),
        );
      },
    );
  });
}
