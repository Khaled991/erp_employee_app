import 'package:flutter/cupertino.dart';

class RootProvider extends ChangeNotifier {
  bool _loading = false;

  void toggleLoading() {
    loading = !loading;
  }

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }
}
