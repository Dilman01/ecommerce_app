import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  factory SecureStorage() {
    return _instance;
  }

  SecureStorage._();

  static final SecureStorage _instance = SecureStorage._();

  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  Future<String?> read(String key) async => await _storage.read(key: key);

  Future<Map<String, String>> readAll() async => await _storage.readAll();
}
