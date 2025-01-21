import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'config/url_config.dart';
import 'interceptors/error_api_interceptor.dart';
import 'interceptors/general_api_interceptor.dart';
import 'interceptors/profile_api_interceptor.dart';

/// API client configuration for different types of endpoints
@singleton
class Api {
  final UrlConfiguration _urlConfig;

  /// Dio instance for authenticated profile-related requests
  late final Dio profile;

  /// Dio instance for general unauthenticated requests
  late final Dio general;

  Api(this._urlConfig) {
    profile = _createProfileDio();
    general = _createGeneralDio();
  }

  /// Default timeout duration for all requests
  static const _defaultTimeout = Duration(seconds: 30);

  /// Creates a Dio instance configured for authenticated profile endpoints
  Dio _createProfileDio() {
    return Dio(
      BaseOptions(
        baseUrl: "${_urlConfig.getApiBaseUrl()}",
        receiveTimeout: _defaultTimeout,
        connectTimeout: _defaultTimeout,
        sendTimeout: _defaultTimeout,
        validateStatus: (status) => status != null && status >= 200 && status < 500,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    )..interceptors.addAll([
        ProfileApiInterceptor(),
        ErrorApiInterceptor(),
      ]);
  }

  /// Creates a Dio instance configured for general unauthenticated endpoints
  Dio _createGeneralDio() {
    return Dio(
      BaseOptions(
        baseUrl: "${_urlConfig.getApiBaseUrl()}",
        receiveTimeout: _defaultTimeout,
        connectTimeout: _defaultTimeout,
        sendTimeout: _defaultTimeout,
        validateStatus: (status) => status != null && status >= 200 && status < 500,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    )..interceptors.addAll([
        GeneralApiInterceptor(),
        ErrorApiInterceptor(),
      ]);
  }

  /// Disposes resources when the client is no longer needed
  void dispose() {
    profile.close();
    general.close();
  }
}
