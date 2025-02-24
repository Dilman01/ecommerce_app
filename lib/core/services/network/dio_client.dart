import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/services/secure_storage/secure_storage.dart';
import 'package:ecommerce_app/core/services/secure_storage/secure_storage_keys.dart';

import 'interceptors.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        headers: {'Content-Type': 'application/json'},
        responseType: ResponseType.json,
      ),
    );

    _dio.interceptors.addAll([
      LoggerInterceptor(),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await SecureStorage().read(
            SecureStorageKeys.accessToken,
          );

          options.headers['Authorization'] = 'Bearer $accessToken';

          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            try {
              await refreshAccessToken();

              final accessToken = await SecureStorage().read(
                SecureStorageKeys.accessToken,
              );

              _dio.options.headers['Authorization'] = 'Bearer $accessToken';

              final retryResponse = await _dio.fetch(error.requestOptions);

              return handler.resolve(retryResponse);
            } catch (e) {
              return handler.next(error);
            }
          }
        },
      ),
    ]);
  }

  // Refresh the access token
  Future<void> refreshAccessToken() async {
    try {
      Logger().i('Refreshing the access token...');

      final refreshToken = await SecureStorage().read(
        SecureStorageKeys.refreshToken,
      );

      final response = await _dio.post(
        ApiConstants.refreshToken,
        data: {"refreshToken": refreshToken},
      );

      await SecureStorage().deleteAll();

      await SecureStorage().write(
        SecureStorageKeys.accessToken,
        response.data['access_token'],
      );

      await SecureStorage().write(
        SecureStorageKeys.refreshToken,
        response.data['refresh_token'],
      );

      Logger().i('Refreshing the access token was successful ✅');
    } on DioException {
      Logger().e('Refreshing the access token failed ❌');
      rethrow;
    }
  }

  // GET METHOD
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  // POST METHOD
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PUT METHOD
  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE METHOD
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
