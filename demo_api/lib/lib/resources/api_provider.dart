

import '../models/api_response_model.dart';
import 'dart:async';
import 'package:http/http.dart' show Client, Response;
import 'dart:convert' show json;
class ApiProvider {
  Client client = Client();
  final baseUrl = 'http://13.250.59.224:56321';
  Future<ApiResponseModel> fetchData(String api, String method,
      Map<String, String> header, Map<String, dynamic> body) async {
    Response response;
    if (method.compareTo('get') == 0) {
      response = await client.get('$baseUrl$api', headers: header);
    } else if (method.compareTo('post') == 0) {
      response = await client.post('$baseUrl$api', headers: header, body: body);
    } else if (method.compareTo('put') == 0) {
      response = await client.put('$baseUrl$api', headers: header, body: body);
    } else if (method.compareTo('patch') == 0) {
      response =
      await client.patch('$baseUrl$api', headers: header, body: body);
    }
    if (response.statusCode == 200) {
      print('Status code is 200');
      return ApiResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}