import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  final Connectivity _connectionChecker;

  const NetworkInfo(this._connectionChecker);

  Future<bool> get isConnected async =>
      await _connectionChecker.checkConnectivity() != ConnectivityResult.none;
}
