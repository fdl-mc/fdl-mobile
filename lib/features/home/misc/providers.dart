import 'package:fdl_api/fdl_api.dart';
import 'package:fdl_app/features/home/controllers/home_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerProvider =
    StateNotifierProvider.autoDispose<HomeController, AsyncValue<User>>(
  (ref) => HomeController(ref),
);
