import 'package:fdl_app/features/home/controllers/home_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeServiceProvider = Provider.autoDispose<HomeController>((ref) {
  return HomeController(ref);
});
