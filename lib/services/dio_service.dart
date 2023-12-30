import 'dart:math';

import 'package:dio/dio.dart';


// method GET
class DioService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/Json';
    return await dio
        .get(url,
            options: Options(
              responseType: ResponseType.json,
              method: 'Get',
            ))
        .then((response) {
      log(response.toString() as num);
      return response;
    });
  }
}
