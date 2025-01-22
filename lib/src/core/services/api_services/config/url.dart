part of 'url_config.dart';

class Url {
  static const String _prodBaseUrl = 'https://faheemkodi.github.io';
  static const String _devBaseUrl = 'https://faheemkodi.github.io';
  static const String _localBaseUrl = 'http://localhost';


  static String get productionBaseUrl => _prodBaseUrl;
  static String get developmentBaseUrl => _devBaseUrl;
  static String get localBaseUrl => _localBaseUrl;

  static String get productionApiBaseUrl => _prodBaseUrl;
  static String get developmentApiBaseUrl => _devBaseUrl;
  static String get localApiBaseUrl => _localBaseUrl;
}
