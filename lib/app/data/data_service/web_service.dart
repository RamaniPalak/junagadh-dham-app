import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:junagadh_temple/app/data/data_service/server_configs.dart';

class WebService{
  var dio = Dio();

  static final shared = WebService();

  Future<Map<String, dynamic>?> getApiDIO(
      {String? path, Map<String, dynamic>? queryParameters}) async {

    try{
      // If api is for array then go with this logic else if it is only json object then dont convert it into array just convert it into Map object
      print('URL:' + ServerConfigs.baseURL + path!);

      final req = Response(
          data: queryParameters, requestOptions: RequestOptions(path: ''));

      print('queryParam: $req');

      Response cool = await dio.get(ServerConfigs.baseURL + path,queryParameters: queryParameters,);

      final data = cool.data as List; // if the response is in array

      final serviceData =  data.first as Map<String, dynamic>;

      print('Res: ${serviceData['response']}');//DOne your response is here

      try{
        if ((cool.statusCode ?? 0) >= 200 && (cool.statusCode ?? 0) < 300) {
          return serviceData['response'];
        }else{
          throw 'Error occurred while Communication with Server, with StatusCode : ${cool.statusCode}';
        }
      }catch (e){
        rethrow;
      }

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

  Future<List<Map<String, dynamic>>?> getApiDIOForList(
      {String? path, Map<String, dynamic>? queryParameters}) async {

    try{
      // If api is for array then go with this logic else if it is only json object then dont convert it into array just convert it into Map object
      print('URL:' + ServerConfigs.baseURL + path!);

      final req = Response(
          data: queryParameters, requestOptions: RequestOptions(path: ''));

      print('queryParam: $req');

      Response cool = await dio.get(ServerConfigs.baseURL + path,queryParameters: queryParameters,);

      List<Map<String,dynamic>> myData = [];

      final data = cool.data as List; // if the response is in array

      // final serviceData =  data.first as Map<String, dynamic>;

      for (var element in data) {
        myData.add(element['response'] as Map<String, dynamic>);
      }

      print('Res: ${myData}');//DOne your response is here

      try{
        if ((cool.statusCode ?? 0) >= 200 && (cool.statusCode ?? 0) < 300) {
          return myData;
        }else{
          throw 'Error occurred while Communication with Server, with StatusCode : ${cool.statusCode}';
        }
      }catch (e){
        rethrow;
      }

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


  Future<Map<String, dynamic>?> postApiDIO(
      {required String path,
        Map<String, dynamic>? queryParameters}) async {
    try {
      print('URL: ' + ServerConfigs.baseURL + path);

      final req = Response(
          data: queryParameters, requestOptions: RequestOptions(path: ''));

      print('queryParam: $req');


      Response<Map<String, dynamic>> cool =
      await dio.post<Map<String, dynamic>>(ServerConfigs.baseURL + path,
          queryParameters: queryParameters,);

      print('Res: $cool');

      return handleResponse(cool);
    } on SocketException {
      throw 'No Internet connection';
    } on DioError catch (e) {
      print(e.response);
      switch (e.type) {
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
    } catch (e) {
      print(e);
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

