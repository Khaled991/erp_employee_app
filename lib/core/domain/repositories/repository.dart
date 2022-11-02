import 'package:erp_employee_app/core/data/api/api.dart';

abstract class Repository {
  final Api api;

  const Repository({
    required this.api,
  });
}
