import 'package:fdl_app/features/auth/pages/login_page.dart';
import 'package:fdl_app/features/home/pages/home_page.dart';
import 'package:fdl_app/features/payment/pages/payment_form_page.dart';
import 'package:fdl_app/features/profiles/pages/profile_page.dart';
import 'package:fdl_app/shared/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutMap = RouteMap(
  onUnknownRoute: (route) => const Redirect('/login'),
  routes: {
    '/login': (_) => MaterialPage(
          child: LoginPage(),
          key: const ValueKey('login'),
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
