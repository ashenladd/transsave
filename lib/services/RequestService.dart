import 'package:http/http.dart' as http;

import '../constant/api.dart';

class RequestService {
  static const String base = APIService.base;
  static Future<http.Response> get(String path) async {
    return await http.get(Uri.parse(base + path));
  }

  static Future<http.Response> post(
      String path, Map<String, dynamic> body) async {
    return await http.post(Uri.parse(base + path), body: body);
  }

  static Future<http.Response> put(
      String path, Map<String, dynamic> body) async {
    return await http.put(Uri.parse(base + path), body: body);
  }

  static Future<http.Response> delete(String path) async {
    return await http.delete(Uri.parse(base + path));
  }
}
