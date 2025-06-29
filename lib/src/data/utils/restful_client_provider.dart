import 'package:dio/dio.dart';

import 'restful_clients.dart';
import 'result_response/app_error.dart';
import 'result_response/result_response.dart';

class RestfulClientProvider {
  static DioExceptionType? _errorType;

  static Future<ResultResponse<T>> getResultResponseRestful<T>(
    MethodRestful method,
    String url, {
    Map<String, String> header = const {},
    Map<String, dynamic>? body,
    Map<String, String>? queryParameters,
  }) async {
    ResultResponse<T> resultResponse = ResultResponse<T>();
    Object? error;

    try {
      final queryResult = await RestfulClients.base<Map<String, dynamic>?>(
        method,
        url,
        header: header,
        body: body,
        queryParameters: queryParameters,
      );

      final queryResultData = queryResult.data;
      if (queryResultData != null) {
        resultResponse = ResultResponse.fromJson<T>(queryResultData);
        resultResponse.statusCode = queryResult.statusCode;
      }
    } on DioException catch (e) {
      _errorType = e.type;

      // handling data must not be null when parsing data on ResultResponse.fromJson
      final data = e.response?.data;
      if (data != null) {
        resultResponse = ResultResponse.fromJson<T>(e.response?.data);
        resultResponse.statusCode = e.response?.statusCode;
      }
      error = e.error;
    } catch (e) {
      error = e;
    }
    AppError? appError;

    if (_errorType != null || error != null) {
      final resultError = resultResponse.appError ?? AppError();

      appError = resultError.copyWith(error: error);
    }
    return resultResponse.copyWith(appError: appError);
  }
}
