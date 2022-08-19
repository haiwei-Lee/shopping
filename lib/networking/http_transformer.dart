import 'package:dio/dio.dart';

import 'http_response.dart';

/// Response 解析
/// 这个class被定义为抽象类因此不能被实例化
abstract class HttpTransformer {
  HttpResponse parse(Response response);
}
