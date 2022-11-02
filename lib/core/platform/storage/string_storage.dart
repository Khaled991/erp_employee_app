import 'package:shared_preferences/shared_preferences.dart';

abstract class Storage<T> {
  final SharedPreferences prefs;

  const Storage(this.prefs);

  Future<void> save(String key, String value);

  String? get(T key);

  Future<void> remove(T key);
}
