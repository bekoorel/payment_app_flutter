import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:payment_app_flutter/core/network/web/api.dart';

class Repo {
  Future<List<Prodact>> dataApi() async {
    try {
      var response = await RestClient(Dio()).getTasks();

      return response;
    } catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.

      if (kDebugMode) {
        print(e);
      }

      return await RestClient(Dio()).getTasks();
    }


    
  }
}
