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
      if (authBloc.state.status == AuthenticationStatus.unauthenticated &&
          state.location != '/login') {
        return '/login';
      }
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final status = context.read<AuthenticationBloc>().state.status;
          if (status == AuthenticationStatus.unknown) {
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
