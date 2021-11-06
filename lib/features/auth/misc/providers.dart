import 'dart:async';

import 'package:fdl_app/features/auth/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gotrue/gotrue.dart' show Session;
import 'package:supabase_flutter/supabase_flutter.dart';

/// Provides Firebase Auth instance
final supabaseProvider = Provider((ref) => Supabase.instance.client);

final supabaseAuthProvider = Provider((ref) => ref.read(supabaseProvider).auth);

/// Provides auth state stream
final authStateProvider = StreamProvider(
  (ref) {
    final stream = StreamController<Session?>.broadcast();
    final callback = ref.watch(supabaseAuthProvider).onAuthStateChange(
      (event, session) {
        stream.sink.add(session);
      },
    );
    ref.onDispose(() {
      callback.data?.unsubscribe();
    });
    return stream.stream;
  },
);

/// Provides current user
final currentUserProvider = Provider(
  (ref) => ref.read(supabaseAuthProvider).currentUser,
);

/// Provides auth service
final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(ref),
);
