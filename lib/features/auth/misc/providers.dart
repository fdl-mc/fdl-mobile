import 'package:fdl_app/features/auth/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides Firebase Auth instance
final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

/// Provides auth state stream
final authStateProvider = StreamProvider<User?>(
  (ref) => ref.read(firebaseAuthProvider).authStateChanges(),
);

/// Provides current user
final currentUserProvider = Provider<User?>(
  (ref) => ref.read(firebaseAuthProvider).currentUser,
);

/// Provides auth service
final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(ref),
);