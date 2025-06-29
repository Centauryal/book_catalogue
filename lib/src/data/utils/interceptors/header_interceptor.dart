import 'dart:io';

import 'package:dio/dio.dart';

InterceptorsWrapper headerInterceptor() {
  return InterceptorsWrapper(
    onRequest: (optionRequest, handler) async {
      final CancelToken cancelToken = CancelToken();

      optionRequest.cancelToken = cancelToken;
      optionRequest.headers[HttpHeaders.acceptHeader] = "*/*";
      optionRequest.headers[HttpHeaders.contentTypeHeader] = "application/json";

      return handler.next(optionRequest);
    },
    onResponse: (e, handler) {
      return handler.next(e);
    },
  );
}
