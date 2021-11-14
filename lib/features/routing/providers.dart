import 'package:fdl_app/features/auth/providers.dart';
import 'package:fdl_app/features/routing/route_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

final routerDelegateProvider = Provider(
  (ref) => RoutemasterDelegate(
    routesBuilder: (BuildContext context) {
      return ref.watch(authStateProvider).when(
            data: (user) => user == null ? loggedOutMap : loggedInMap,
            loading: () => loadingMap,
            error: (_, __) => loggedOutMap,
          );
    },
  ),
);

final routerParserProvider = Provider((ref) => const RoutemasterParser());
