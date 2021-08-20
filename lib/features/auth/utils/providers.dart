import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freedomland/features/auth/services/auth_service.dart';

final authServiceProvider = Provider((ref) => AuthService(ref));

final usernameTextStateProvider = StateProvider((ref) => '');
final passwordTextStateProvider = StateProvider((ref) => '');

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
final authStateChangesProvider = StreamProvider.autoDispose<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});
