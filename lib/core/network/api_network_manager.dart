import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:turk_ai_test/core/constants/app_constants.dart';
import 'package:turk_ai_test/core/network/interceptors/logger_interceptor.dart';

import 'interceptors/dio_connectivity_request_retrier.dart';
import 'interceptors/retry_interceptor.dart';

class ApiNetworkManager {
  static ApiNetworkManager? _instance;
  late Dio dio;

  static ApiNetworkManager get instance {
    if (_instance == null) _instance = ApiNetworkManager._init();
    return _instance!;
  }

  ApiNetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: ApiConstants.BASE_URL,
      headers: {
        "Content-Type": "application/json",
      },
    );
    dio = Dio(baseOptions);
    dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: dio,
          connectivity: Connectivity(),
        ),
      ),
    );
    dio.interceptors.add(
      LoggerInterceptor(this.runtimeType.toString()),
    );
  }
}
