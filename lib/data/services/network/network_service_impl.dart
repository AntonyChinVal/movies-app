import 'package:app/data/config/env_config.dart';
import 'package:app/domain/entities/network_error_handler.dart';
import 'package:app/domain/services/network/network_service.dart';
import 'package:dio/dio.dart';

class NetworkServiceImpl extends NetworkService {
  final Dio _dio;

  NetworkServiceImpl({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: EnvConfig.baseUrl,
              headers: {
                "Authorization": "Bearer ${EnvConfig.apiKey}",
                "Content-Type": "application/json"
              },
            ));

  @override
  Future<T> get<T>({
    required String endpoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<T>(
        endpoint,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );
      return response.data as T;
    } on DioException catch (e) {
      throw NetworkError.fromDioError(e);
    } catch (e) {
      throw NetworkError(message: e.toString());
    }
  }
}
