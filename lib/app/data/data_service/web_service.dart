import 'dart:io';

import 'package:dio/dio.dart';

class WebService{
  var dio = Dio();

  static final shared = WebService();

  Future<Map<String, dynamic>?> getApiDIO(String url) async {

    try{
      Response<Map<String, dynamic>> cool = await dio.get<Map<String, dynamic>>(url);

      print('Res: ${cool.data}');

      return handleResponse(cool);

    } on SocketException {
      throw 'No Internet connection';
    } on DioError catch(e){
      switch(e.type){
        case DioErrorType.connectTimeout:
          throw 'Connection timeOut';
        case DioErrorType.sendTimeout:
          throw 'Connection timeOut';
        case DioErrorType.receiveTimeout:
          throw 'Connection timeOut';
        case DioErrorType.response:
          throw 'Something went wrong.';
        case DioErrorType.cancel:
          throw 'Request Canceled by user';
        case DioErrorType.other:
          throw 'Something went wrong.';
      }
    }catch(e){
      rethrow;
    }

  }

  Map<String, dynamic>? handleResponse(Response<Map<String, dynamic>> cool){
    try{
      if ((cool.statusCode ?? 0) >= 200 && (cool.statusCode ?? 0) < 300) {
        return cool.data;
      }else{
        throw 'Error occurred while Communication with Server, with StatusCode : ${cool.statusCode}';
      }
    }catch (e){
      rethrow;
    }
  }

}

