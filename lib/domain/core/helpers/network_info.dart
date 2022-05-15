import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfoImpl {
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();

  Future<bool> isConnected() async {
    connectionStatus = await (connectivity.checkConnectivity());

    if (connectionStatus != ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }
}
