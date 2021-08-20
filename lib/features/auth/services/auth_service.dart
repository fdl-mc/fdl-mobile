import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freedomland/features/auth/utils/providers.dart';

// TODO: wrap methods with try/catch (from ui or here?? here is unconsistent to show *ui* snackbars in a *business logic*)
class AuthService {
  final ProviderReference _ref;
  final FirebaseAuth _auth;

  AuthService(this._ref) : _auth = _ref.read(firebaseAuthProvider);

  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email + '@fdl.ru',
      password: password,
    );
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> changePassword(
    String username,
    String oldPassword,
    String password,
  ) async {
    await login(username, oldPassword);
    await _auth.currentUser!.updatePassword(password);
  }
}
