import 'package:fdl_app/features/auth/misc/providers.dart';
import 'package:fdl_app/features/routing/misc/route_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

final routerDelegateProvider = Provider(
  (ref) => RoutemasterDelegate(
    routesBuilder: (BuildContext context) {
      return ref.watch(authStateProvider).data?.when(
                data: (user) => user == null ? loggedOutMap : loggedInMap,
                loading: () => loadingMap,
                error: (_, __) => loggedOutMap,
              ) ??
          loadingMap;
    },
  ),
);

final routerParserProvider = Provider((ref) => const RoutemasterParser());
