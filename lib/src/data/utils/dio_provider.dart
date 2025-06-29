import 'package:dio/dio.dart';

import 'endpoints.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';

extension on Dio {
  void initInterceptors(Dio dio) {
    interceptors
      ..add(headerInterceptor())
      ..add(PrettyDioLogger(requestHeader: true, requestBody: true));
  }
}

class ApiProvider {
  static final _dio = Dio(_baseOptions);

  static final _baseOptions = BaseOptions();

  static Dio get dioClient {
    return _dio;
  }

  static void init() {
    _dio.initInterceptors(_dio);
  }

  static String get baseUrl => Endpoints.baseUrlDev;
}
