import 'dart:convert';

import 'package:dio/dio.dart';
import 'http_response.dart';
import 'http_transformer.dart';

class DefaultHttpTransformer extends HttpTransformer {
  @override
  HttpResponse parse(Response response) {
    Map<String, dynamic> responseData = {};
    if (response.data is String) {
      responseData = jsonDecode(response.data);
    } else if (response.data is Map) {
      responseData = response.data;
    }
    if (responseData["error"] == null) {
      return HttpResponse.success(responseData);
    } else {
      return HttpResponse.failure(
          errorMsg: responseData["error"]['message'],
          errorCode: int.parse(responseData["error"]["code"]));
    }
  }

  /// 单例对象
  static DefaultHttpTransformer _instance = DefaultHttpTransformer._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DefaultHttpTransformer._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory DefaultHttpTransformer.getInstance() => _instance;
}
