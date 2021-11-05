import 'package:fdl_api/fdl_api.dart';
import 'package:fdl_app/features/auth/misc/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fdlApiProvider = Provider<FdlApi>(
  (ref) => FdlApi('calamity34.ddns.net:3000'),
);

final userEconomyProvider = FutureProvider.autoDispose<EconomyStats>(
  (ref) => ref
      .read(fdlApiProvider)
      .getUserEconomyStats(ref.read(currentUserProvider)!.uid),
);
