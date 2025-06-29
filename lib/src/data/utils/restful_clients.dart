import 'package:dio/dio.dart';

import 'dio_provider.dart';

enum MethodRestful { get, post, put, delete }

class RestfulClients {
  static Map<String, String> headers() => {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static Future<Response<T>> base<T>(
    MethodRestful method,
    String url, {
    Map<String, String>? header,
    Map<String, dynamic>? body,
    Map<String, String>? queryParameters,
  }) async {
    Response<T> response;

    switch (method) {
      case MethodRestful.get:
        response = await ApiProvider.dioClient.get(
          '${ApiProvider.baseUrl}$url',
          queryParameters: queryParameters,
          options: Options(headers: header),
        );
        break;
      case MethodRestful.post:
        response = await ApiProvider.dioClient.post(
          '${ApiProvider.baseUrl}$url',
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: header),
        );
        break;
      case MethodRestful.put:
        response = await ApiProvider.dioClient.put(
          '${ApiProvider.baseUrl}$url',
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: header),
        );
        break;
      case MethodRestful.delete:
        response = await ApiProvider.dioClient.delete(
          '${ApiProvider.baseUrl}$url',
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: header),
        );
        break;
    }

    return response;
  }
}
