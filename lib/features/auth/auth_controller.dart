import 'package:fdl_app/features/auth/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController {
  AuthController(this._ref);
  final ProviderReference _ref;

  Future<void> signIn() =>
      _ref.read(authServiceProvider).signInWithOauth('discord');

  Future<void> signOut() => _ref.read(authServiceProvider).signOut();
}
