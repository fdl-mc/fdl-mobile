import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class AuthService {
  final Account _account;

  final StreamController<User?> _state = StreamController.broadcast();
  Stream<User?> get state => _state.stream;

  User? _user;
  User? get user => _user;

  AuthService(Client client) : _account = Account(client) {
    _checkCurrent();
  }

  Future<void> _checkCurrent() async {
    try {
      final acc = await _account.get();
      _state.sink.add(acc);
      _user = acc;
    } on AppwriteException {
      _state.sink.add(null);
      _user = null;
    }
  }

  Future<void> signInWithOauth(String provider) async {
    await _account.createOAuth2Session(provider: provider);
    _checkCurrent();
  }

  Future<void> signOut([String sessionId = 'current']) async {
    await _account.deleteSession(sessionId: sessionId);
    _checkCurrent();
  }
}
