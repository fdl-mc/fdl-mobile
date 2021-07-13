import 'package:freedomland/controller/password_change_controller.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordChangeController>(() => PasswordChangeController());
  }
}
