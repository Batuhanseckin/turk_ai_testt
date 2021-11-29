import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class DioConnectivityRequestRetrier {
  final Dio dio;
  final Connectivity connectivity;

  DioConnectivityRequestRetrier({
    required this.dio,
    required this.connectivity,
  });

  Future<void> scheduleRequestRetry(
    DioError error,
    ErrorInterceptorHandler handler,
  ) async {
    StreamSubscription? streamSubscription;

    streamSubscription = Connectivity().onConnectivityChanged.listen(
      (connectivityResult) async {
        if (connectivityResult != ConnectivityResult.none) {
          streamSubscription?.cancel();
          final options = new Options(
            method: error.requestOptions.method,
            headers: error.requestOptions.headers,
          );
          final cloneReq = await dio.request(
            error.requestOptions.path,
            options: options,
            data: error.requestOptions.data,
            queryParameters: error.requestOptions.queryParameters,
          );
          return handler.resolve(cloneReq);
        }
      },
    );
  }
}