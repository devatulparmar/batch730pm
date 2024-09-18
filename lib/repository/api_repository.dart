import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ApiRepository {
  final dio = Dio();

  Future getDioRequest(url) async {
    return await dio.get(url);
  }

  Future<Response> postDioRequest(
    String url, {
    dynamic data,
    dynamic headers,
    dynamic queryParameters,
    CancelToken? cancelToken,
  }) async {
    return await dio.post(
      url,
      data: data,
      // data: FormData.fromMap(data),
      // queryParameters: queryParameters,
      // cancelToken: cancelToken,
      // options: Options(
      //   headers: headers,
      //   // contentType: 'Application/json',
      //   followRedirects: false,
      //   receiveTimeout: const Duration(seconds: 5),
      //   sendTimeout: const Duration(seconds: 2),
      // ),
    );
  }

  Future getAPIRequest(String url, {dynamic headers}) async {
    return await http.get(Uri.parse(url), headers: headers);
  }

  Future postAPIRequest(String url, {dynamic body, dynamic headers}) async {
    return await http.post(Uri.parse(url), body: body, headers: {
      'authentication': "token",
    });
  }
}
