import 'package:dio/dio.dart';
import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/data_state.dart';
import 'package:erp_employee_app/core/errors/error_messages.dart';
import 'package:erp_employee_app/core/errors/exceptions.dart';
import 'package:erp_employee_app/features/auth/data/models/user.dart';
import 'package:erp_employee_app/features/auth/data/platform/auth_storage.dart';
import 'package:erp_employee_app/features/auth/domain/providers/auth_provider.dart';
import 'package:erp_employee_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_provider_test.mocks.dart';

@GenerateMocks([AuthRepository, AuthStorage])
void main() {
  late MockAuthRepository mockAuthRepository;
  late MockAuthStorage mockAuthStorage;

  late AuthProvider authProvider;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockAuthStorage = MockAuthStorage();

    authProvider = AuthProvider(
      authRepository: mockAuthRepository,
      authStorage: mockAuthStorage,
    );
  });

  group('signIn', () {
    final User user = User(accessToken: "acjacjoasjoca==");
    test(
        'should set userState.data=User.fromJson(...) when respository returns data successfully',
        () async {
      // arrange
      when(mockAuthRepository.signIn(
        username: anyNamed("username"),
        password: anyNamed("password"),
      )).thenAnswer((_) async => user);
      // act and assert
      expect(
        authProvider.userState,
        equals(
          const DataState<User?>(
              apiState: ApiState.IDLE, errorMessage: null, data: null),
        ),
      );
      final asnycSignIn =
          authProvider.signIn(username: "username", password: "password");

      verify(mockAuthRepository.signIn(
        username: anyNamed("username"),
        password: anyNamed("password"),
      ));
      expect(
        authProvider.userState,
        equals(
          const DataState<User?>(
              apiState: ApiState.LOADING, errorMessage: null, data: null),
        ),
      );
      await asnycSignIn;

      expect(
        authProvider.userState,
        equals(
          DataState<User?>(
              apiState: ApiState.LOADED, errorMessage: null, data: user),
        ),
      );
    });

    test(
        "should set apiState = ApiState.ERROR when throws NoInternetConnectionException",
        () async {
      // arrange
      when(mockAuthRepository.signIn(
        username: anyNamed("username"),
        password: anyNamed("password"),
      )).thenThrow(NoInternetException());
      // act and assert
      expect(
        authProvider.userState,
        equals(
          const DataState<User?>(
              apiState: ApiState.IDLE, errorMessage: null, data: null),
        ),
      );
      final asnycSignIn =
          authProvider.signIn(username: "username", password: "password");

      verify(mockAuthRepository.signIn(
        username: anyNamed("username"),
        password: anyNamed("password"),
      ));
      expect(
        authProvider.userState,
        equals(
          const DataState<User?>(
              apiState: ApiState.LOADING, errorMessage: null, data: null),
        ),
      );
      await asnycSignIn;

      expect(
        authProvider.userState,
        equals(
          const DataState<User?>(
            apiState: ApiState.ERROR,
            errorMessage: ErrorMessages.NO_INTERNET_CONNECTION,
            data: null,
          ),
        ),
      );
    });

    test(
        "should set apiState = ApiState.ERROR when throws DioError, and set errorMessage to Something went wrong",
        () async {
      // arrange
      const errorMessage = "Internal server error";
      when(mockAuthRepository.signIn(
        username: anyNamed("username"),
        password: anyNamed("password"),
      )).thenThrow(
        DioError(
          requestOptions: RequestOptions(path: "/"),
          response: Response(
            data: errorMessage,
            statusCode: 500,
            requestOptions: RequestOptions(path: "/"),
          ),
        ),
      );
      // act and assert
      expect(
        authProvider.userState,
        equals(
          const DataState<User?>(
              apiState: ApiState.IDLE, errorMessage: null, data: null),
        ),
      );
      final asnycSignIn =
          authProvider.signIn(username: "username", password: "password");

      verify(mockAuthRepository.signIn(
        username: anyNamed("username"),
        password: anyNamed("password"),
      ));
      expect(
        authProvider.userState,
        equals(
          const DataState<User?>(
              apiState: ApiState.LOADING, errorMessage: null, data: null),
        ),
      );
      await asnycSignIn;

      expect(
        authProvider.userState,
        equals(
          const DataState<User?>(
            apiState: ApiState.ERROR,
            errorMessage: ErrorMessages.SOMETHING_WENT_WRONG_TRY_AGAIN,
            data: null,
          ),
        ),
      );
    });
  });

  group('signOut', () {
    test(
      "should call authStorage.removeToken when signOut is called",
      () async {
        // arrange
        when(mockAuthStorage.removeToken()).thenAnswer((_) async => {});
        // act
        await authProvider.signOut();
        // assert
        verify(mockAuthStorage.removeToken());
      },
    );
  });

  group('getSavedUser', () {
    test(
      "should return User when _authStorage.getToken() returns token",
      () async {
        // arrange
        const accessToken = "==ahcskjahckjsa";
        when(mockAuthStorage.getToken()).thenReturn(accessToken);
        // act
        final user = authProvider.getSavedUser();
        // assert
        expect(user, equals(User(accessToken: accessToken)));
      },
    );

    test(
      "should return null when _authStorage.getToken() returns null",
      () async {
        // arrange
        when(mockAuthStorage.getToken()).thenReturn(null);
        // act
        final user = authProvider.getSavedUser();
        // assert
        expect(user, null);
      },
    );
  });
}
