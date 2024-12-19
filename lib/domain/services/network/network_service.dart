abstract class NetworkService {
  Future<T> get<T>({
    required String endpoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  });
}
