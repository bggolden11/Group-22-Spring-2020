import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/src/HTTPClient/http_client.dart';
import 'package:flutter_app/src/encrypter/encrypter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/src/models/employee_login_credentials.dart';

void main() {

  test('HTTP Get all tasks API call should return status code 200 OK for retrieval', () async {
    int statusCode = 0;
    try {
      final Dio httpClient = new HTTPClient().dio;
      final Response response = await httpClient.get("https://waitless-functions-2.azurewebsites.net/api/Get-All-Tasks?code=en6hGfbSMIdl/VPvvYvZrDn0vguXJMiOj1pju5ZycqEFsT3pZw8mkA==");
      statusCode = response.statusCode;
//      print(response.data.toString());
    } on DioError catch (e){
      statusCode = e.response.statusCode;
    }
    expect(200, statusCode);
  });

}

