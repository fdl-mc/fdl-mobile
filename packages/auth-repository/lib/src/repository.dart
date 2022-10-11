import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthRepository {
  final FlutterSecureStorage _storage;
  final StreamController<AuthStatus> _controller;

  AuthRepository()
      : _storage = FlutterSecureStorage(),
        _controller = StreamController.broadcast();

  Stream<AuthStatus> get status async* {
    if (await tokenExists()) {
      yield AuthStatus.authenticated;
    } else {
      yield AuthStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<void> setToken(String token) async {
    await _storage.write(key: 'token', value: token);
    _controller.sink.add(AuthStatus.authenticated);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
    _controller.sink.add(AuthStatus.unauthenticated);
  }

  Future<bool> tokenExists() async {
    return await _storage.containsKey(key: 'token');
  }

  void dispose() {
    _controller.close();
  }
}