import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  AndroidOptions get _aOptions =>
      AndroidOptions(encryptedSharedPreferences: true, resetOnError: true);

  Future<void> saveToken(String token) async =>
      await _storage.write(key: 'token', value: token, aOptions: _aOptions);

  Future<String?> getToken() async =>
      await _storage.read(key: 'token', aOptions: _aOptions);

  Future<void> removeToken() async =>
      await _storage.delete(key: 'token', aOptions: _aOptions);
}
