import 'package:fdl_app/features/home/home_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerProvider = ChangeNotifierProvider((ref) {
  var c = HomeController(ref);
  c.fetch();
  return c;
});
