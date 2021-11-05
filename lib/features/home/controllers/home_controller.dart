import 'package:fdl_api/fdl_api.dart';
import 'package:fdl_app/features/auth/misc/providers.dart';
import 'package:fdl_app/features/fdl_api/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends ChangeNotifier {
  final ProviderReference _ref;

  AsyncValue<EconomyStats> get economyStats => _economyStats;
  AsyncValue<Passport> get passport => _passport;

  AsyncValue<EconomyStats> _economyStats;
  AsyncValue<Passport> _passport;

  HomeController(this._ref)
      : _economyStats = const AsyncValue.loading(),
        _passport = const AsyncValue.loading() {
    _fetch();
  }

  Future<void> _fetch() async {
    _economyStats = const AsyncValue.loading();
    _passport = const AsyncValue.loading();

    _economyStats = await AsyncValue.guard(() => _ref
        .read(fdlApiProvider)
        .getUserEconomyStats(_ref.read(currentUserProvider)!.uid));

    _passport = await AsyncValue.guard(() => _ref
        .read(fdlApiProvider)
        .getPassport(_ref.read(currentUserProvider)!.uid));
  }
}
