import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiUtils {
  static Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return _handleResponse(response);
  }

  static Future<dynamic> post(String url, Map<String, dynamic> body) async {
    final response = await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
      "Content-Type": "application/json"
    });
    return _handleResponse(response);
  }

  static Future<dynamic> put(String url, Map<String, dynamic> body) async {
    final response = await http.put(Uri.parse(url), body: jsonEncode(body), headers: {
      "Content-Type": "application/json"
    });
    return _handleResponse(response);
  }

  static dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
      case 404:
      case 500:
      default:
        throw Exception('Error: ${response.statusCode}');
    }
  }
}
