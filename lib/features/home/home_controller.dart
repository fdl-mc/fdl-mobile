import 'package:fdl_api/fdl_api.dart';
import 'package:fdl_app/features/auth/providers.dart';
import 'package:fdl_app/features/fdl_api/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends ChangeNotifier {
  final ProviderReference _ref;
  AsyncValue<User> user;

  HomeController(this._ref) : user = const AsyncValue.loading();

  Future<void> fetch() async {
    user = const AsyncValue.loading();
    notifyListeners();

    try {
      user = AsyncValue.data(await _ref
          .read(fdlApiProvider)
          .getUser(_ref.read(currentUserProvider)!.uid));
    } catch (err, stack) {
      user = AsyncValue.error(err, stack);
    }
    notifyListeners();
  }
}
