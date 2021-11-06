import 'package:fdl_app/features/routing/misc/route_maps.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

final routeMapProvider = StateProvider((ref) => loadingMap);

final routerParserProvider = Provider((ref) => const RoutemasterParser());
