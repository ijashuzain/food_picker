import 'package:food_picker/src/core/services/api_services/config/url_config.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiEndpoints {
  final UrlConfiguration _urlConfig;

  ApiEndpoints(this._urlConfig);

  String get listPhotos => '${_urlConfig.getBaseUrl()}/photos';

}
