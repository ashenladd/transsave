import 'package:http/http.dart' as http;

class RequestService {
  static Future<http.Response> get(String url) async {
    return await http.get(url as Uri);
  }

  static Future<http.Response> post(
      String url, Map<String, dynamic> body) async {
    return await http.post(url as Uri, body: body);
  }

  static Future<http.Response> put(
      String url, Map<String, dynamic> body) async {
    return await http.put(url as Uri, body: body);
  }

  static Future<http.Response> delete(String url) async {
    return await http.delete(url as Uri);
  }
}
