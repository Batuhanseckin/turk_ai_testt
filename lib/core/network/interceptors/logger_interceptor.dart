import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:turk_ai_test/core/logger.dart';

class LoggerInterceptor extends Interceptor {
  final String logName;
  late Logger log;

  LoggerInterceptor(this.logName) {
    log = getLogger(logName);
  }
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.wtf('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.wtf(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log.wtf(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}
