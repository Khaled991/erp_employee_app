import 'package:erp_employee_app/core/data/entities/provider_state/data_state.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/provider_state.dart';
import 'package:erp_employee_app/core/domain/providers/abs_provider.dart';
import 'package:erp_employee_app/features/auth/data/models/user.dart';
import 'package:erp_employee_app/features/auth/data/platform/auth_storage.dart';

import 'package:erp_employee_app/features/auth/domain/repository/auth_repository.dart';

class AuthProvider extends AbsProvider {
  final AuthRepository _authRepository;
  final AuthStorage _authStorage;

  DataState<User?> _userState = const DataState<User?>(data: null);

  AuthProvider({
    required AuthRepository authRepository,
    required AuthStorage authStorage,
  })  : _authRepository = authRepository,
        _authStorage = authStorage;

  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    await makeApiRequest(
      setState: setUserState,
      callback: () async {
        User user = await _authRepository.signIn(
          username: username,
          password: password,
        );

        await _authStorage.saveToken(user);

        setUserState((state) => state.copyWith(data: user));
      },
    );
  }

  Future<void> signOut() async {
    await _authStorage.removeToken();
  }

  User? getSavedUser() {
    String? token = _authStorage.getToken();
    if (token == null) return null;

    User user = User.fromJson({
      'accessToken': token,
    });

    return user;
  }

  DataState<User?> get userState => _userState;

  void setUserState(ProviderStateSetterParameter<DataState> setState) {
    ProviderState userState = setState(this.userState);
    _userState = userState as DataState<User?>;
    notifyListeners();
  }
}
