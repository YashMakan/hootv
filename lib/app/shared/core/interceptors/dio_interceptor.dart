import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class URLInterceptor extends Interceptor {
  String dynamicBaseUrl;

  URLInterceptor(this.dynamicBaseUrl);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = dynamicBaseUrl;
    options.headers.addAll({
      // "Authorization": "Bearer ${}"
    });
    // debugPrint('---');
    // debugPrint(options.path);
    // debugPrint(jsonEncode(options.headers));
    // debugPrint('---');
    handler.next(options);
  }
}

class ResponseInterceptor extends Interceptor {
  ResponseInterceptor();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String requestEndpoint = response.realUri.toString();
    // debugPrint('---');
    // debugPrint('Request Endpoint: $requestEndpoint');
    // debugPrint('Response Status Code: ${response.statusCode}');
    // debugPrint('Response Data: ${response.data}');
    // debugPrint('---');
    handler.next(response);
  }
}

Dio customDio() {
  final dio = Dio(BaseOptions(contentType: 'application/json'));
  const url = "http://10.0.2.2:8000";
  debugPrint("Running on $url.");
  dio.interceptors.add(URLInterceptor(url));
  dio.interceptors.add(ResponseInterceptor());
  return dio;
}
