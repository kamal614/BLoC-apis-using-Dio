import 'package:dio/dio.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

class API {
  final Dio _dio = Dio();

  API() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    _dio.interceptors.add(PrettyDioLogger());
  }

  //Here we're creating a getter so that we can access this anywhere in the application
  Dio get sendRequest => _dio;
  //send request can be any name
}
