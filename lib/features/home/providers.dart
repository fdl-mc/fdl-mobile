import 'package:fdl_app/features/home/home_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerProvider = ChangeNotifierProvider.autoDispose((ref) {
  return HomeController(ref)..fetch();
});
