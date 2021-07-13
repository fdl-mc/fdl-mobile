import 'package:freedomland/controller/auth_controller.dart';
import 'package:freedomland/controller/user_controller.dart';
import 'package:freedomland/provider/user_provider.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserProvider>(UserProvider(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
    // Get.put<UserController>(UserController());
  }
}
