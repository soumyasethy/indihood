import 'dart:convert';

import 'package:http/http.dart' as http;

//single class which exposes api client
class ApiService {
  ApiService._();

  //GET method
  static Future<Map<String, dynamic>> get(String url) async {
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    }
    return null;
  }
}
