import 'package:dio/dio.dart';
import 'app_dio.dart';
import 'http_config.dart';
import 'http_parse.dart';
import 'http_response.dart';
import 'http_transformer.dart';

enum HttpMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
}

class HttpClient {
  late AppDio _dio;

  HttpClient({BaseOptions? options, HttpConfig? dioConfig})
      : _dio = AppDio(options: options, dioConfig: dioConfig);

  Future<HttpResponse> request<T>(String path,
      {HttpMethod method = HttpMethod.get,
      Map<String, dynamic>? params,
      data,
      CancelToken? cancelToken,
      Options? options,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer}) async {
    const _methodValues = {
      HttpMethod.get: 'get',
      HttpMethod.post: 'post',
      HttpMethod.put: 'put',
      HttpMethod.delete: 'delete',
      HttpMethod.patch: 'patch',
      HttpMethod.head: 'head'
    };

    try {
      Response response;
      response = await _dio.request(path,
          data: data,
          queryParameters: params,
          cancelToken: cancelToken,
          options: checkOptions(_methodValues[method], options),
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return handleResponse(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  Options checkOptions(String? method, Options? options) {
    options ??= Options();
    options.method = method ?? "get";
    return options;
  }

  Future<HttpResponse> get(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer}) async {
    return request(url,
        params: queryParameters,
        options: options,
        onReceiveProgress: onReceiveProgress,
        httpTransformer: httpTransformer);
  }

  Future<HttpResponse> post(String url,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer}) async {
    return request(
      url,
      data: data,
      options: checkOptions('POST', options),
      params: queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<HttpResponse> patch(String url,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer}) async {
    return request(
      url,
      data: data,
      params: queryParameters,
      options: checkOptions('PATCH', options),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<HttpResponse> delete(String url,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      HttpTransformer? httpTransformer}) async {
    return request(
      url,
      data: data,
      params: queryParameters,
      options: checkOptions('DELETE', options),
      cancelToken: cancelToken,
    );
  }

  Future<HttpResponse> put(String url,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer}) async {
    return request(
      url,
      data: data,
      params: queryParameters,
      options: checkOptions('PUT', options),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> download(String urlPath, savePath,
      {ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      bool deleteOnError = true,
      String lengthHeader = Headers.contentLengthHeader,
      data,
      Options? options,
      HttpTransformer? httpTransformer}) async {
    try {
      var response = await _dio.download(
        urlPath,
        savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,
        options: data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}
