import 'package:fdl_api/fdl_api.dart';
import 'package:fdl_app/features/fdl_api/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePageController extends StateNotifier<AsyncValue<User>> {
  final ProviderReference _ref;
  final String id;

  ProfilePageController(this._ref, this.id)
      : super(const AsyncValue.loading()) {
    _fetch();
  }

  Future<void> _fetch() async {
    state = await AsyncValue.guard(() => _ref.read(fdlApiProvider).getUser(id));
  }
}
