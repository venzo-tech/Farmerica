import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farmerica/config/config.dart';
import 'package:farmerica/model/customer.dart';

class APIService {
  static Future<bool> createCustomer(CustomerModel model) async {
    var authToken = base64Encode(utf8.encode("${Config.key}:${Config.secret}"));

    bool ret = false;

    try {
      var response = await Dio().post(Config.url + Config.customerUrl,
          data: model.toJson(),
          options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Basic $authToken', HttpHeaders.contentTypeHeader: "application/json"},
          ));

      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }
}
