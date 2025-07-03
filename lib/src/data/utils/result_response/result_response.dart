import 'package:flutter/foundation.dart';

import 'app_error.dart';
import 'json_convert.dart';

class ResultResponse<T> {
  ResultResponse({this.data, this.statusCode, AppError? appError})
    : _appError = (appError?.hasNotError ?? true) ? null : appError;

  /// Http Status Code
  int? statusCode;

  /// According to Confluence
  final T? data;

  /// Application requirement
  final AppError? _appError;

  AppError? get appError => _appError;

  static ResultResponse<T> fromJson<T>(Map<String, dynamic> jsonRes) {
    T? data;
    AppError? error;

    try {
      /// Parsing json to class response
      data = JsonConvert.fromJson<T>(jsonRes);
    } catch (e) {
      error = AppError(error: e);
      debugPrint("ERROR: Failed to convert ResultResponse to JSON");
    }

    return ResultResponse(
      data: _asTLogger<T>(data, 'results'),
      appError: error,
    );
  }

  ResultResponse<T> copyWith({T? data, int? statusCode, AppError? appError}) {
    return ResultResponse<T>(
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
      appError: appError ?? _appError,
    );
  }

  static T? _asTLogger<T>(dynamic value, String key) {
    if (value is T) {
      return value;
    }
    debugPrint('WARNING: wrong value assigned to $key on ResultResponse');

    return null;
  }
}
