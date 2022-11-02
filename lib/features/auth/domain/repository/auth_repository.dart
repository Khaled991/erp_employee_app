import 'package:erp_employee_app/core/data/api/api.dart';
import 'package:erp_employee_app/core/data/entities/request_params/post_request_params.dart';
import 'package:erp_employee_app/core/domain/repositories/repository.dart';
import 'package:erp_employee_app/features/auth/data/models/user.dart';
import 'package:erp_employee_app/features/auth/data/paths/auth_api_paths.dart';

class AuthRepository extends Repository {
  const AuthRepository({required Api<User> api}) : super(api: api);

  Future<User> signIn({
    required String username,
    required String password,
  }) {
    return api.postJson<User>(
      params: PostRequestParams(
        path: AuthApiPaths.signIn,
        data: {"username": username, "password": password},
      ),
      fromJson: User.fromJson,
    );
  }
}
