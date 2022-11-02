import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:erp_employee_app/core/data/api/api.dart';
import 'package:erp_employee_app/core/data/api/api_request.dart';
import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';
import 'package:erp_employee_app/core/data/models/paginated_response/paginated_response.dart';
import 'package:erp_employee_app/core/errors/error_messages.dart';
import 'package:erp_employee_app/core/errors/exceptions.dart';
import 'package:erp_employee_app/core/platform/network_info.dart';
import 'package:erp_employee_app/features/notifications/data/models/hr_message.dart';
import 'package:erp_employee_app/features/notifications/data/paths/hr_message_api_paths.dart';
import 'package:erp_employee_app/features/notifications/domain/providers/hr_message_provider.dart';
import 'package:erp_employee_app/features/notifications/domain/repository/hr_message_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'hr_message_provider_test.mocks.dart';

@GenerateMocks([HrMessageRepository, Socket])
void main() {
  late MockHrMessageRepository mockHrMessageRepository;
  late MockSocket mockSocket;

  late HrMessagesProvider hrMessageProvider;

  group("findAll", () {
    setUp(() {
      mockHrMessageRepository = MockHrMessageRepository();
      mockSocket = MockSocket();

      hrMessageProvider = HrMessagesProvider(
        hrMessRepository: mockHrMessageRepository,
        socket: mockSocket,
      );
    });

    PaginatedResponse<HrMessage> buildPaginatedHrMessages({
      required int total,
      required int last,
    }) =>
        PaginatedResponse<HrMessage>(
          first: 1,
          last: last,
          limit: 10,
          total: total,
          data: List<HrMessage>.generate(
            10,
            (index) => HrMessage(
              id: index,
              message: "message",
              messageDateTime: DateTime.now(),
              seen: false,
            ),
          ),
        );

    test(
      "should set paginated list to data and hasMore to false when total == last",
      () async {
        // arrange
        const int total = 10, last = 10;
        when(mockHrMessageRepository.findAll(any, any)).thenAnswer(
            (_) async => buildPaginatedHrMessages(total: total, last: last));
        //act and assert
        expect(hrMessageProvider.listState.apiState, ApiState.IDLE);
        expect(hrMessageProvider.listState.data.length, equals(0));

        final findAll = hrMessageProvider.findAll();
        expect(hrMessageProvider.listState.apiState, ApiState.LOADING);
        await findAll;

        expect(hrMessageProvider.listState.apiState, ApiState.LOADED);
        expect(hrMessageProvider.listState.data.length, greaterThan(0));
        expect(hrMessageProvider.listState.hasMore, false);
      },
    );

    test(
      "should set paginated list to data and hasMore to false when total != last",
      () async {
        const int total = 20, last = 10;
        //arrange
        when(mockHrMessageRepository.findAll(any, any)).thenAnswer(
            (_) async => buildPaginatedHrMessages(total: total, last: last));
        //act and assert
        expect(hrMessageProvider.listState.apiState, ApiState.IDLE);
        expect(hrMessageProvider.listState.data.length, equals(0));

        final findAll = hrMessageProvider.findAll();
        expect(hrMessageProvider.listState.apiState, ApiState.LOADING);
        await findAll;

        expect(hrMessageProvider.listState.apiState, ApiState.LOADED);
        expect(hrMessageProvider.listState.data.length, greaterThan(0));
        expect(hrMessageProvider.listState.hasMore, true);
      },
    );

    test(
      "should set apiState = ApiState.ERROR when throws NoInternetConnectionException",
      () async {
        //arrange
        when(mockHrMessageRepository.findAll(any, any))
            .thenThrow(NoInternetException());
        //act and assert
        expect(hrMessageProvider.listState.apiState, ApiState.IDLE);
        expect(hrMessageProvider.listState.data.length, equals(0));

        final findAll = hrMessageProvider.findAll();
        expect(hrMessageProvider.listState.apiState, ApiState.LOADING);
        await findAll;

        expect(hrMessageProvider.listState.apiState, ApiState.ERROR);
        expect(
          hrMessageProvider.listState.errorMessage,
          ErrorMessages.NO_INTERNET_CONNECTION,
        );
      },
    );

    test(
      "should set apiState = ApiState.ERROR when throws DioError, and set errorMessage to Something went wrong",
      () async {
        //arrange
        const errorMessage = "Internal server error";
        when(mockHrMessageRepository.findAll(any, any)).thenThrow(
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
        expect(hrMessageProvider.listState.apiState, ApiState.IDLE);
        expect(hrMessageProvider.listState.data.length, equals(0));

        final findAll = hrMessageProvider.findAll();
        expect(hrMessageProvider.listState.apiState, ApiState.LOADING);
        await findAll;

        expect(hrMessageProvider.listState.apiState, ApiState.ERROR);
        expect(
          hrMessageProvider.listState.errorMessage,
          ErrorMessages.SOMETHING_WENT_WRONG_TRY_AGAIN,
        );
      },
    );
  });

  group('onMessageReceived', () {
    setUp(() {
      mockHrMessageRepository = MockHrMessageRepository();
      mockSocket = MockSocket();

      hrMessageProvider = HrMessagesProvider(
        hrMessRepository: HrMessageRepository(
          socket: mockSocket,
          api: Api<HrMessage>(
            apiRequest: ApiRequest(networkInfo: NetworkInfo(Connectivity())),
            dio: Dio(),
            baseRequestPath: HrMessageApiPaths.basePath,
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
          (_) async => hrMessageProvider.shiftToListState(
            HrMessage.fromJson({
              "id": 1,
              "message": "message",
              "messageDateTime": DateTime.now().toIso8601String(),
              "seen": false,
            }),
          ),
        );
        // act
        final int messagesCount = hrMessageProvider.listState.data.length;
        hrMessageProvider.onMessageReceived();
        // assert
        expect(hrMessageProvider.listState.data.length, messagesCount + 1);
      },
    );
  });
}
