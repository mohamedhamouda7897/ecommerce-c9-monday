import 'package:dio/dio.dart';
import 'package:ecommerce_c9_monday/core/utils/constants.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  // static void initDio(){
  //   dio=Dio();
  // }
  Future<Response> getData(
      {required String endPoint, required Map<String, dynamic> data}) {
    return dio.get(Constants.baseURl + endPoint, queryParameters: data);
  }

  Future<Response> postData(
      {required String endPoint, required Map<String, dynamic> body}) {
    return dio.post(Constants.baseURl + endPoint, data: body);
  }
}
