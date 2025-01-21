import 'package:injectable/injectable.dart';

import '../../../di/di.dart';

part 'url.dart';

abstract class UrlConfiguration {
  getBaseUrl();
  getApiBaseUrl();
}

@LazySingleton(as: UrlConfiguration, env: [Env.prod])
class ProductionUrlConfiguration implements UrlConfiguration {
  @override
  getApiBaseUrl() => Url.productionApiBaseUrl;

  @override
  getBaseUrl() => Url.productionBaseUrl;
}

@LazySingleton(as: UrlConfiguration, env: [Env.dev])
class DevelopmentUrlConfiguration implements UrlConfiguration {
  @override
  getApiBaseUrl() => Url.developmentApiBaseUrl;

  @override
  getBaseUrl() => Url.developmentBaseUrl;
}

@LazySingleton(as: UrlConfiguration, env: [Env.local])
class LocalUrlConfiguration implements UrlConfiguration {
  @override
  getApiBaseUrl() => Url.localApiBaseUrl;

  @override
  getBaseUrl() => Url.localBaseUrl;
}
