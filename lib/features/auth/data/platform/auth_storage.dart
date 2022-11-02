import 'package:erp_employee_app/core/platform/storage/storage.dart';
import 'package:erp_employee_app/features/auth/data/models/user.dart';

class AuthStorage {
  final StringStorage _storage;
  final _tokenKey = 'token';

  AuthStorage(this._storage);

  Future<void> saveToken(User user) async {
    final String token = user.accessToken;
    await _storage.save(_tokenKey, token);
  }

  Future<void> removeToken() async {
    await _storage.remove(_tokenKey);
  }

  String? getToken() {
    return _storage.get(_tokenKey);
  }
}
