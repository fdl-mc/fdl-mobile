import 'package:fdl_api/fdl_api.dart';
import 'package:fdl_app/features/auth/misc/providers.dart';
import 'package:fdl_app/features/fdl_api/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends StateNotifier<AsyncValue<User>> {
  final ProviderReference _ref;

  HomeController(this._ref) : super(const AsyncValue.loading()) {
    _fetch();
  }

  Future<void> _fetch() async {
    state = const AsyncValue.loading();

    try {
      state = AsyncValue.data(await _ref
          .read(fdlApiProvider)
          .getUser(_ref.read(currentUserProvider)!.uid));
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }
}
