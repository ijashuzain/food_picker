import 'package:dio/dio.dart';
import '../utils/api_logger.dart';

class ProfileApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    try {
      handler.next(options);
    } on StateError {
      /// Do nothing.
    } catch (e) {
      handler.reject(DioException(requestOptions: options), true);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    ApiLogger().logSuccessResponse(response);
  }
}
