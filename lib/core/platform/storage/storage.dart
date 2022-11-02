import 'package:erp_employee_app/core/platform/storage/string_storage.dart';

class StringStorage extends Storage<String> {
  StringStorage(super.prefs);

  @override
  Future<void> save(String key, String value) async {
    await prefs.setString(key, value);
  }

  @override
  String? get(String key) {
    return prefs.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    await prefs.remove(key);
  }
}
