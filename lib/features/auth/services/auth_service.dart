import 'package:fdl_app/features/auth/misc/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:gotrue/gotrue.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  AuthService(this._ref);
  final ProviderReference _ref;

  Future<void> signInWithDiscord() => Supabase.instance.client.auth
      .signInWithProvider(
        Provider.discord,
        options:
            AuthOptions(redirectTo: kIsWeb ? null : 'fdl-mc.ru/login/callback'),
      )
      .then((value) => print(value));

  Future<void> signOut() => _ref.read(supabaseAuthProvider).signOut();
}
