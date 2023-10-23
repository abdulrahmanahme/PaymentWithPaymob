import 'package:dio/dio.dart';

class DioHelperPayment {
  static late Dio dio;
  static  initial() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://accept.paymob.com/api/',
          receiveDataWhenStatusError: true,
          headers: {'Content-Type': 'application/json'}),
    );
  }

  static Future<Response> getData(
      {required String url,  Map<String, dynamic>? query}) async {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query}) async {
    return await dio.post(url, data: data, queryParameters: query);
  }
}
