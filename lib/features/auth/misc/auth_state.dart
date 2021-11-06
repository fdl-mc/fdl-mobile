import 'package:fdl_app/features/routing/misc/providers.dart';
import 'package:fdl_app/features/routing/misc/route_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gotrue/gotrue.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState {
  @override
  void onAuthenticated(Session session) {
    print('auth!');
    context.read(routeMapProvider).state = loggedInMap;
  }

  @override
  void onErrorAuthenticating(String message) {
    print('err: $message');
  }

  @override
  void onPasswordRecovery(Session session) {
    print('what');
  }

  @override
  void onUnauthenticated() {
    print('unauth');
    context.read(routeMapProvider).state = loggedOutMap;
  }
}
