import 'dart:math';

import 'package:dio/dio.dart';
import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/data_state.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/paginated_state.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/pagination_filter.dart';
import 'package:erp_employee_app/core/data/entities/duration_limits/duration_limits.dart';
import 'package:erp_employee_app/core/data/models/paginated_response/paginated_response.dart';
import 'package:erp_employee_app/core/errors/error_messages.dart';
import 'package:erp_employee_app/core/errors/exceptions.dart';
import 'package:erp_employee_app/core/utils/date_time_util.dart';
import 'package:erp_employee_app/features/attendance/data/models/attendance.dart';
import 'package:erp_employee_app/features/attendance/domain/providers/attendance_provider.dart';
import 'package:erp_employee_app/features/attendance/domain/repository/attendance_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'attendance_provider_test.mocks.dart';

@GenerateMocks([AttendanceRepository])
void main() {
  late MockAttendanceRepository mockAttendanceRepository;
  late AttendanceProvider attendanceProvider;

  setUp(() {
    mockAttendanceRepository = MockAttendanceRepository();

    attendanceProvider =
        AttendanceProvider(attendanceRepository: mockAttendanceRepository);
  });

  group('findDurationLimits', () {
    test(
      "should set duration limits when attendanceRepository.findDurationLimits returns data",
      () async {
        // arrange
        final durationLimits = DurationLimits(
          start: DateTime.now().subtract(const Duration(days: 400)),
          end: DateTime.now(),
        );
        when(mockAttendanceRepository.findDurationLimits())
            .thenAnswer((_) async => durationLimits);
        // act and assert
        expect(attendanceProvider.durationLimitsState.apiState, ApiState.IDLE);

        final findDurationLimits = attendanceProvider.findDurationLimits();
        expect(
          attendanceProvider.durationLimitsState.apiState,
          ApiState.LOADING,
        );

        await findDurationLimits;
        expect(
          attendanceProvider.durationLimitsState,
          DataState<DurationLimits>(
            apiState: ApiState.LOADED,
            data: durationLimits,
            errorMessage: null,
          ),
        );
      },
    );
    test(
      "should keep duration limits null when attendanceRepository.findDurationLimits returns 404",
      () async {
        // arrange
        when(mockAttendanceRepository.findDurationLimits()).thenThrow(DioError(
          requestOptions: RequestOptions(path: "/attendance/duration-limits"),
          response: Response(
            requestOptions: RequestOptions(path: "/attendance/duration-limits"),
            statusCode: 404,
            data: {"statusCode": 404, "message": "Not Found"},
          ),
        ));
        // act and assert
        expect(attendanceProvider.durationLimitsState.apiState, ApiState.IDLE);

        final findDurationLimits = attendanceProvider.findDurationLimits();
        expect(
          attendanceProvider.durationLimitsState.apiState,
          ApiState.LOADING,
        );

        await findDurationLimits;
        expect(
          attendanceProvider.durationLimitsState,
          const DataState<DurationLimits>(
            apiState: ApiState.ERROR,
            data: null,
            errorMessage: null,
          ),
        );
      },
    );
  });

  final month = DateTimeUtils.toYYYYMM(DateTime.now());
  PaginatedResponse<Attendance> buildPaginatedAttendances({
    required int total,
    required int last,
  }) =>
      PaginatedResponse<Attendance>(
        first: 1,
        last: last,
        limit: 10,
        total: total,
        data: List<Attendance>.generate(
          10,
          (index) => Attendance(
            id: index,
            attendTime: DateTime.now(),
            leaveTime: DateTime.now(),
          ),
        ),
      );

  group("refreshFindAll", () {
    test(
      "should empty list and add new data and set page=1 when refresh is called",
      () async {
        //arrange
        final PaginatedResponse<Attendance> attendancesBeforeRefresh =
            buildPaginatedAttendances(total: 11, last: 11);
        final PaginatedResponse<Attendance> attendancesAfterRefresh =
            buildPaginatedAttendances(total: 255, last: 10);

        attendanceProvider.setListState(
          (state) => (state as PaginatedState).copyWith(
            data: attendancesBeforeRefresh.data,
            filter: PaginationFilter(page: 3, month: month),
            hasMore: false,
          ),
        );

        when(mockAttendanceRepository.findAll(any, any))
            .thenAnswer((_) async => attendancesAfterRefresh);
        //act and assert
        expect(
          attendanceProvider.listState,
          PaginatedState<Attendance>(
            apiState: ApiState.LOADED,
            errorMessage: null,
            filter: PaginationFilter(
              page: 3,
              month: month,
            ),
            hasMore: false,
            data: attendancesBeforeRefresh.data,
          ),
        );
        final refreshFindAll = attendanceProvider.refreshFindAll();
        expect(attendanceProvider.listState.apiState, ApiState.LOADING);

        await refreshFindAll;
        expect(
          attendanceProvider.listState,
          PaginatedState<Attendance>(
            apiState: ApiState.LOADED,
            data: attendancesAfterRefresh.data,
            filter: PaginationFilter(
              page: 1,
              month: month,
            ),
            hasMore: attendancesAfterRefresh.hasMore,
            errorMessage: null,
          ),
        );

        expect(attendanceProvider.listState.data.length, 10);
      },
    );
  });

  group(
    'findAll',
    () {
      test(
        "should set paginated list to data and hasMore to false when total == last",
        () async {
          //arrange
          const int total = 10, last = 10;

          final attendnaces =
              buildPaginatedAttendances(total: total, last: last);
          when(mockAttendanceRepository.findAll(any, any))
              .thenAnswer((_) async => attendnaces);
          //act and assert
          expect(attendanceProvider.listState.apiState, ApiState.IDLE);
          expect(attendanceProvider.listState.data.length, equals(0));

          final findAll = attendanceProvider.findAll();
          expect(attendanceProvider.listState.apiState, ApiState.LOADING);
          await findAll;

          expect(
            attendanceProvider.listState,
            PaginatedState<Attendance>(
              apiState: ApiState.LOADED,
              data: attendnaces.data,
              errorMessage: null,
              hasMore: false,
              filter: PaginationFilter(page: 1, month: month),
            ),
          );
        },
      );
      test(
        "should set paginated list to data and hasMore to false when total != last",
        () async {
          const int total = 20, last = 10;
          //arrange
          when(mockAttendanceRepository.findAll(any, any)).thenAnswer(
              (_) async => buildPaginatedAttendances(total: total, last: last));
          //act and assert
          expect(attendanceProvider.listState.apiState, ApiState.IDLE);
          expect(attendanceProvider.listState.data.length, equals(0));

          final findAll = attendanceProvider.findAll();
          expect(attendanceProvider.listState.apiState, ApiState.LOADING);
          await findAll;

          expect(attendanceProvider.listState.apiState, ApiState.LOADED);
          expect(attendanceProvider.listState.data.length, greaterThan(0));
          expect(attendanceProvider.listState.hasMore, true);
        },
      );

      test(
          "should append paginated list to data and set page = n when findAll called n times where n>=2",
          () async {
        const int total = 20, last = 10;
        //arrange
        final attendnaces = buildPaginatedAttendances(total: total, last: last);
        when(mockAttendanceRepository.findAll(any, any))
            .thenAnswer((_) async => attendnaces);
        //act
        final callTimes = 2 + Random().nextInt(5);
        for (var i = 0; i < callTimes; i++) {
          await attendanceProvider.findAll();
        }

        //assert
        verify(mockAttendanceRepository.findAll(any, any)).called(callTimes);
        expect(
          attendanceProvider.listState,
          PaginatedState<Attendance>(
            apiState: ApiState.LOADED,
            data: attendnaces.data,
            errorMessage: null,
            hasMore: true,
            filter: PaginationFilter(page: callTimes, month: month),
          ),
        );
      });

      test(
        "should set apiState = ApiState.ERROR when throws NoInternetConnectionException",
        () async {
          //arrange
          when(mockAttendanceRepository.findAll(any, any))
              .thenThrow(NoInternetException());
          //act and assert
          expect(attendanceProvider.listState.apiState, ApiState.IDLE);
          expect(attendanceProvider.listState.data.length, equals(0));

          final findAll = attendanceProvider.findAll();
          expect(attendanceProvider.listState.apiState, ApiState.LOADING);
          await findAll;

          expect(attendanceProvider.listState.apiState, ApiState.ERROR);
          expect(
            attendanceProvider.listState.errorMessage,
            ErrorMessages.NO_INTERNET_CONNECTION,
          );
        },
      );

      test(
        "should set apiState = ApiState.ERROR when throws DioError, and set errorMessage to Something went wrong",
        () async {
          //arrange
          const errorMessage = "Internal server error";
          when(mockAttendanceRepository.findAll(any, any)).thenThrow(
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
          expect(attendanceProvider.listState.apiState, ApiState.IDLE);
          expect(attendanceProvider.listState.data.length, equals(0));

          final findAll = attendanceProvider.findAll();
          expect(attendanceProvider.listState.apiState, ApiState.LOADING);
          await findAll;

          expect(attendanceProvider.listState.apiState, ApiState.ERROR);
          expect(
            attendanceProvider.listState.errorMessage,
            ErrorMessages.SOMETHING_WENT_WRONG_TRY_AGAIN,
          );
        },
      );
    },
  );

  group("getLast", () {
    final lastAttendance = Attendance(
      id: 1,
      attendTime: DateTime.now(),
      leaveTime: null,
    );

    setUp(() {
      attendanceProvider.setGetLastAttendanceState(
        (state) => state.copyWith(
          apiState: ApiState.IDLE,
          errorMessage: null,
        ),
      );
    });
    test(
      "should add last attendance to listState.data to index 0 when listState.data is empty",
      () async {
        // arrange
        when(mockAttendanceRepository.findLast())
            .thenAnswer((_) async => lastAttendance);
        // act and assert
        expect(
          attendanceProvider.getLastAttendanceState.apiState,
          ApiState.IDLE,
        );
        expect(attendanceProvider.listState.data.length, 0);

        final getLast = attendanceProvider.getLast();
        expect(
          attendanceProvider.getLastAttendanceState.apiState,
          ApiState.LOADING,
        );

        await getLast;
        expect(
          attendanceProvider.getLastAttendanceState.apiState,
          ApiState.LOADED,
        );

        verify(mockAttendanceRepository.findLast());
        expect(attendanceProvider.listState.data.length, 1);
        expect(attendanceProvider.listState.data[0], lastAttendance);
      },
    );

    test(
      "should not add last attendance to listState.data when listState.data is not empty",
      () async {
        // arrange
        final alreadyAddedAttendnace = Attendance(
          id: 22,
          attendTime: DateTime.now(),
          leaveTime: DateTime.now(),
        );
        attendanceProvider.setGetLastAttendanceState(
          (state) => state.copyWith(
            apiState: ApiState.LOADED,
            errorMessage: null,
          ),
        );
        when(mockAttendanceRepository.findLast())
            .thenAnswer((_) async => lastAttendance);
        attendanceProvider.shiftToListState(alreadyAddedAttendnace);
        // act and assert
        expect(
          attendanceProvider.getLastAttendanceState.apiState,
          ApiState.LOADED,
        );
        expect(attendanceProvider.listState.data.length, greaterThan(0));

        final getLast = attendanceProvider.getLast();
        expect(
          attendanceProvider.getLastAttendanceState.apiState,
          isIn([ApiState.IDLE, ApiState.LOADING, ApiState.LOADED]),
        );

        await getLast;
        expect(
          attendanceProvider.getLastAttendanceState.apiState,
          ApiState.LOADED,
        );

        verifyNever(mockAttendanceRepository.findLast());
        expect(attendanceProvider.listState.data.length, 1);
        expect(
          attendanceProvider.listState.data[0],
          isNot(equals(lastAttendance)),
        );
        expect(
          attendanceProvider.listState.data[0],
          equals(alreadyAddedAttendnace),
        );
      },
    );

    test(
      "should not add last attendance to listState.data when getLastAttendanceState.apiState = ApiState.LOADED",
      () async {
        // arrange
        final alreadyAddedAttendnace = Attendance(
          id: 22,
          attendTime: DateTime.now(),
          leaveTime: DateTime.now(),
        );
        attendanceProvider.setGetLastAttendanceState(
          (state) => state.copyWith(apiState: ApiState.LOADED),
        );
        when(mockAttendanceRepository.findLast())
            .thenAnswer((_) async => lastAttendance);
        attendanceProvider.shiftToListState(alreadyAddedAttendnace);
        // act and assert
        expect(
          attendanceProvider.getLastAttendanceState.apiState,
          ApiState.LOADED,
        );
        expect(attendanceProvider.listState.data.length, greaterThan(0));

        await attendanceProvider.getLast();

        verifyNever(mockAttendanceRepository.findLast());
        expect(attendanceProvider.listState.data.length, 1);
        expect(
          attendanceProvider.listState.data[0],
          isNot(equals(lastAttendance)),
        );
        expect(
          attendanceProvider.listState.data[0],
          equals(alreadyAddedAttendnace),
        );
      },
    );
  });

  group("attend", () {
    final attendance = Attendance(
      id: 1,
      attendTime: DateTime.now(),
      leaveTime: null,
    );
    test(
      "should apiState = ApiState.LOADED and add received Attendance to first item in the list when AttendanceRepository returns Attendance",
      () async {
        //arrange
        when(mockAttendanceRepository.attend())
            .thenAnswer((_) async => attendance);
        //act and assert
        expect(attendanceProvider.attendState.apiState, ApiState.IDLE);

        final attend = attendanceProvider.attend();
        expect(attendanceProvider.attendState.apiState, ApiState.LOADING);

        final attendanceListLength = attendanceProvider.listState.data.length;
        expect(attendanceListLength, equals(0));

        await attend;
        verify(mockAttendanceRepository.attend());
        expect(attendanceProvider.attendState.apiState, ApiState.LOADED);
        expect(
          attendanceProvider.listState.data.length,
          equals(attendanceListLength + 1),
        );
        expect(attendanceProvider.listState.data[0], attendance);
      },
    );
    test(
      "should apiState = ApiState.Error when AttendanceRepository throws an exception",
      () async {
        //arrange
        when(mockAttendanceRepository.attend()).thenThrow(Exception());
        //act and assert
        expect(attendanceProvider.attendState.apiState, ApiState.IDLE);
        final attend = attendanceProvider.attend();
        expect(attendanceProvider.attendState.apiState, ApiState.LOADING);
        await attend;
        expect(attendanceProvider.attendState.apiState, ApiState.ERROR);
      },
    );
  });

  group("leave", () {
    final lastAttendance = Attendance(
      id: 1,
      attendTime: DateTime.now(),
      leaveTime: null,
    );
    final leaveResponse = lastAttendance.copyWith(leaveTime: DateTime.now());
    test(
      "should apiState = ApiState.LOADED and overwrite first element in the attendances list when AttendanceRepository returns Attendance with leaveTime!=null",
      () async {
        //arrange
        when(mockAttendanceRepository.leave())
            .thenAnswer((_) async => leaveResponse);
        attendanceProvider.shiftToListState(lastAttendance);
        //act and assert
        expect(attendanceProvider.leaveState.apiState, ApiState.IDLE);

        final attend = attendanceProvider.leave();
        expect(attendanceProvider.leaveState.apiState, ApiState.LOADING);

        final attendanceListLength = attendanceProvider.listState.data.length;
        expect(attendanceListLength, greaterThan(0));

        await attend;
        verify(mockAttendanceRepository.leave());
        expect(attendanceProvider.leaveState.apiState, ApiState.LOADED);
        expect(attendanceProvider.listState.data.length, attendanceListLength);
        expect(attendanceProvider.listState.data[0], leaveResponse);
      },
    );
    test(
      "should apiState = ApiState.Error when AttendanceRepository throws an exception",
      () async {
        //arrange
        when(mockAttendanceRepository.leave()).thenThrow(Exception());
        //act and assert
        expect(attendanceProvider.leaveState.apiState, ApiState.IDLE);
        final attend = attendanceProvider.leave();
        expect(attendanceProvider.leaveState.apiState, ApiState.LOADING);
        await attend;
        expect(attendanceProvider.leaveState.apiState, ApiState.ERROR);
      },
    );
  });
}
