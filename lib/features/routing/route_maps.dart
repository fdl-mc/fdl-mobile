import 'package:fdl_app/features/auth/login_page.dart';
import 'package:fdl_app/features/home/home_page.dart';
import 'package:fdl_app/features/payment/payment_form_page.dart';
import 'package:fdl_app/features/profiles/profile_page.dart';
import 'package:fdl_app/features/settings/settings_page.dart';
import 'package:fdl_app/shared/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutMap = RouteMap(
  onUnknownRoute: (route) => const Redirect('/login'),
  routes: {
    '/login': (_) => const MaterialPage(
          child: LoginPage(),
          key: ValueKey('login'),
        ),
    '/profile/:id': (_) => MaterialPage(
          child: ProfilePage(_.pathParameters['id']!),
          key: const ValueKey('profile'),
        ),
  },
);

final loggedInMap = RouteMap(
  onUnknownRoute: (route) => const Redirect('/'),
  routes: {
    '/': (_) => const MaterialPage(
          child: HomePage(),
          key: ValueKey('home'),
        ),
    '/pay': (_) => MaterialPage(
          child: PaymentFormPage(),
          key: const ValueKey('payment'),
        ),
    '/profile/:id': (_) => MaterialPage(
          child: ProfilePage(_.pathParameters['id']!),
          key: const ValueKey('profile'),
        ),
    '/settings': (_) => const MaterialPage(
          child: SettignsPage(),
          key: ValueKey('settings'),
        ),
  },
);

final loadingMap = RouteMap(
  onUnknownRoute: (route) => const MaterialPage(
    child: Scaffold(
      body: Center(
        child: Icon(CustomIcons.fdl_icon, size: 64),
        key: ValueKey('loading'),
      ),
    ),
  ),
  routes: const {},
);
