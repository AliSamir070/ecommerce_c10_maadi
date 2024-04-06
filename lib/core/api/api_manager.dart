import 'package:dio/dio.dart';
import 'package:ecommerce_c10_maadi/core/constants.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiManager{
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl
      )
    );
  }

  Future<Response> getRequest({required String endpoint,Map<String, dynamic>? queryParameters })async{
    var response = await dio.get(endpoint,queryParameters: queryParameters);
    return response;
  }
  Future<Response> postRequest({required String endpoint , Map<String,dynamic>? body})async{
    return await dio.post(endpoint,data: body);
  }
}