import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final _storage = FlutterSecureStorage();

  // read value
  static Future<String?> readValue(String key) async {
    return await _storage.read(key: key);
  }

  //read all value
  static Future<Map<String, String>> readAllValue() async {
    return await _storage.readAll();
  }

  // write value
  static Future<void> writeValue(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // delete value
  static Future<void> deleteValue(String key) async {
    await _storage.delete(key: key);
  }

  //delete key
  static Future<void> deleteAllValue() async {
    await _storage.deleteAll();
  }
}
