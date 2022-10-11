import 'package:auth_repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freedomland/authentication/authentication.dart';
import 'package:freedomland/home/home.dart';
import 'package:freedomland/login/login.dart';
import 'package:freedomland/splash/splash.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter router(AuthenticationBloc authBloc) {
  final refreshStream = GoRouterRefreshStream(authBloc.stream);
  return GoRouter(
    refreshListenable: refreshStream,
    redirect: (context, state) async {
      final loggingIn = state.location == '/login';
      final loggedIn = authBloc.state.status == AuthStatus.authenticated;
      if (!loggedIn) {
        if (!loggingIn) {
          return '/login';
        } else {
          return null;
        }
      }

      if (loggingIn) return '/';
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final status = context.watch<AuthenticationBloc>().state.status;
          if (status == AuthStatus.unknown) {
            return const SplashPage();
          }
          return child;
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/login',
            builder: (context, state) => const LoginPage(),
          ),
        ],
      ),
    ],
  );
}
