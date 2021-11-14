import 'package:fdl_api/fdl_api.dart';
import 'package:fdl_app/features/profiles/profile_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profilePageControllerProvider = StateNotifierProvider.family
    .autoDispose<ProfilePageController, AsyncValue<User>, String>(
  (ref, id) => ProfilePageController(ref, id),
);
