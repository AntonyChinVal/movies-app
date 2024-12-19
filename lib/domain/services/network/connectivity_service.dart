abstract class ConnectivityService {
  Future<bool> isConnected();
  Stream<bool> get onConnectivityChanged;
}
