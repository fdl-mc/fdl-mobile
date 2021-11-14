import 'package:fdl_app/features/auth/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController {
  AuthController(this._ref);
  final ProviderReference _ref;

  Future<void> signInWithEmailAndPassword(String email, String password) => _ref
      .read(firebaseAuthProvider)
      .signInWithEmailAndPassword(email: email, password: password);

  Future<void> signOut() => _ref.read(firebaseAuthProvider).signOut();
}
