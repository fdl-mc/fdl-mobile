import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freedomland/controller/bindings/home_binding.dart';
import 'package:freedomland/controller/bindings/initial_binding.dart';
import 'package:freedomland/features/auth/pages/login_page.dart';
import 'package:freedomland/features/auth/utils/providers.dart';
import 'package:freedomland/features/root/utils/showSnackbar.dart';
import 'package:freedomland/ui/home_page/home_page.dart';
import 'package:freedomland/ui/splash_screen.dart';

/// Provides auth state checking
class RootPage extends ConsumerWidget {
  RootPage() : super();

  @override
  Widget build(BuildContext context, watch) {
    final authState = watch(authStateChangesProvider);

    /// FIXME: remove this
    InitialBinding().dependencies();

    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: authState.when(
          data: (user) {
            if ((user == null)) {
              return LoginPage();
            } else {
              /// FIXME: remove this
              HomeBinding().dependencies();

              // TODO: remove this
              showSnackbar(context, SnackBar(content: Text('logged in!')));

              return HomePage();
            }
          },
          loading: () {
            return SplashScreen();
          },
          error: (e, stack) {
            return Center(child: Text(e.toString()));
          },
        ),
      ),
    );
  }
}
